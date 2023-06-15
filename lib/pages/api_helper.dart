import 'dart:convert';

import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  Future<UserModel> fetchData() async {
    var url =
        Uri.parse("https://kavara-club-backend23.uw.r.appspot.com/attendances");
    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception("Unexpected error occure");
      UserModel;
    }
  }
}
