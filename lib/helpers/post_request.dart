import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tezda_app/controllers/db_controller.dart';
import 'package:tezda_app/pages/login_page.dart';
import 'package:tezda_app/widgets/snack_bar.dart';
import 'dart:convert';

import '../main.dart';
import '../modules/user.dart';

Future<dynamic> httpPostRequest(
    String route, Map<String, dynamic> body, int? id) async {
  User user = await DBProvider.db.checkIfUserHasAccount();
  try {
    var response =
        await http.post(Uri.parse("$url$route${id != null ? '/$id' : ''}"),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user.token}'
            },
            body: jsonEncode(body));
    //waiting for the user to interact with the api for data and then notfiy for updating session
    if (response.statusCode == 401) {
      Get.offAll(() => const LoginScreen());
    }
    var result = jsonDecode(response.body);
    return result;
  } catch (e) {
    showSnackbar(e.toString(), null);
  }
}
