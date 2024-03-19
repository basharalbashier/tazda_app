import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tezda_app/controllers/db_controller.dart';
import 'package:tezda_app/main.dart';
import 'package:tezda_app/modules/user.dart';
import 'package:tezda_app/pages/login_page.dart';
import 'package:tezda_app/pages/products_page.dart';
import '../helpers/post_request.dart';
import 'login_text.dart';

Widget loginWidget(bool isObsecure, bool isWaiting, bool rememberMe,
        usernameControler, passwordControler) =>
    StatefulBuilder(builder: (context, setState) {
      login() async {
        setState(() => isWaiting = !isWaiting);
        var body = {
          "username": usernameControler.text.toString(),
          "password": passwordControler.text.toString()
        };

        var request = await httpPostRequest('auth/login', body, null);
        if (request != null) {
          User user = User(
              username: usernameControler.text,
              password: passwordControler.text,
              token: request['token']);
          if (rememberMe) {
            await DBProvider.db.addUser(user);
            Get.offAll(() => const ProductsList());
            return;
          }
          currentUser = user;
          Get.offAll(() => const ProductsList());
        }
        setState(() => isWaiting = !isWaiting);
      }

      return Container(
        height: 400,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: Colors.black.withOpacity(0.1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Center(
                        child: TextUtil(
                      text: "Login",
                      weight: true,
                      size: 30,
                    )),
                    const Spacer(),
                    TextUtil(
                      text: "Username",
                    ),
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: TextFormField(
                        controller: usernameControler,
                        enabled: !isWaiting,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextUtil(
                      text: "Password",
                    ),
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: TextFormField(
                        controller: passwordControler,
                        enabled: !isWaiting,
                        obscureText: isObsecure,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () =>
                                  setState(() => isObsecure = !isObsecure),
                              icon: Icon(
                                isObsecure ? Icons.lock : Icons.lock_open,
                                color: Colors.white,
                              )),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Checkbox(
                            value: rememberMe,
                            onChanged: (v) => setState(() => rememberMe = v!)),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextUtil(
                          text: "Remember Me ",
                          size: 12,
                          weight: true,
                        ))
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      alignment: Alignment.center,
                      child: GestureDetector(
                          onTap: () => login(),
                          child: isWaiting
                              ? const CircularProgressIndicator.adaptive()
                              : TextUtil(
                                  text: "Log In",
                                  color: Colors.black,
                                )),
                    ),
                    const Spacer(),
                    Center(
                        child: TextButton(
                      onPressed: () => Get.to(() => const LoginScreen(
                            selectedIndex: 1,
                          )),
                      child: TextUtil(
                        text: "Don't have a account REGISTER",
                        size: 12,
                        weight: true,
                      ),
                    )),
                    const Spacer(),
                  ],
                ),
              )),
        ),
      );
    });
