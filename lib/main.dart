import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'modules/user.dart';
import 'pages/login_page.dart';

String url = 'https://fakestoreapi.com/';
User? currentUser;
final navigatorKey = GlobalKey<NavigatorState>();

List<String> bgList = [
  "lib/assets/bg1.jpeg",
  "lib/assets/bg2.jpeg",
    "lib/assets/tezda.jpg",
];
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
/*
   username: "mor_2314",
   password: "83r5^_"
 */