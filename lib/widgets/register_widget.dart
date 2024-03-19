import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tezda_app/helpers/post_request.dart';

import 'login_text.dart';

Widget registerWidget(bool isObsecure, bool isWaiting, bool rememberMe) =>
    StatefulBuilder(builder: (context, setState) {
      var usernameControler = TextEditingController();
      var firstNameControler = TextEditingController();
      var lastNameControler = TextEditingController();
      var emailControler = TextEditingController();
      var passwordControler = TextEditingController();
      var rePasswordControler = TextEditingController();
      var phoneControler = TextEditingController();

      login() async {
        setState(() => isWaiting = !isWaiting);
        var body = {
          'email': emailControler.text,
          'username': usernameControler.text,
          'password': passwordControler.text,
          'name': {
            'firstname': firstNameControler.text,
            'lastname': lastNameControler.text
          },
          'address': {
            'city': 'kilcoole',
            'street': '7835 new road',
            'number': 3,
            'zipcode': '12926-3874',
            'geolocation': {'lat': '-37.3159', 'long': '81.1496'}
          },
          'phone': phoneControler.text
        };

        await httpPostRequest('users', body, null);
      }

      return Container(
        height: 600,
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
                      text: "REGISTER",
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
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextUtil(
                      text: "Name",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: firstNameControler,
                              enabled: !isWaiting,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                label: Text(' First'),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: lastNameControler,
                              enabled: !isWaiting,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                label: Text(' Last'),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextUtil(
                      text: "Email",
                    ),
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: TextFormField(
                        controller: emailControler,
                        enabled: !isWaiting,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextUtil(
                      text: "Password",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: passwordControler,
                              enabled: !isWaiting,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                label: Text('password'),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextFormField(
                              controller: rePasswordControler,
                              enabled: !isWaiting,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                label: Text('re-write password'),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextUtil(
                      text: "Phone",
                    ),
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: TextFormField(
                        controller: phoneControler,
                        enabled: !isWaiting,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
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
                                  text: "REGISTER",
                                  color: Colors.black,
                                )),
                    ),
                    const Spacer(),
                  ],
                ),
              )),
        ),
      );
    });
