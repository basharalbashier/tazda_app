import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_app/pages/products_page.dart';
import 'package:tezda_app/widgets/login_widget.dart';
import 'package:tezda_app/widgets/register_widget.dart';

import '../controllers/db_controller.dart';
import '../main.dart';
import '../modules/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.selectedIndex});
  final int? selectedIndex;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameControler = TextEditingController();
  var passwordControler = TextEditingController();
  User? user;
  bool showOption = false;
  bool isObsecure = true;
  bool rememberMe = false;
  bool isWaiting = false;
  @override
  void initState() {
    _checkAccount();
    super.initState();
  }

  _checkAccount() async {
    User data = await DBProvider.db.checkIfUserHasAccount();
    data.username.isEmpty
        ? setState(() => user = data)
        : Get.offAll(() => const ProductsList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: user == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(bgList[widget.selectedIndex == null
                        ? 0
                        : widget.selectedIndex!]),
                    fit: BoxFit.fill),
              ),
              alignment: Alignment.center,
              child: widget.selectedIndex == 1
                  ? registerWidget(isObsecure, isWaiting, rememberMe)
                  : loginWidget(isObsecure, isWaiting, rememberMe,
                      usernameControler, passwordControler)),
    );
  }
}


