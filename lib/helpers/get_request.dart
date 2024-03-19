import 'package:http/http.dart' as http;
import 'package:tezda_app/widgets/snack_bar.dart';
import 'dart:convert';
import '../main.dart';

Future<dynamic> httpGetRequest(String route, int? id) async {
  try {
    var response = await http.get(
        Uri.parse("$url$route${id != null ? '/$id' : ''}"),
        headers: {'Content-Type': 'application/json'});
    var result = jsonDecode(response.body);
    return result;
  } catch (e) {
    showSnackbar(e.toString(), null);
  }
}
