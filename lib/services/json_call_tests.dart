import 'dart:convert';
import 'dart:math';
import 'package:e_check_survey/models/user_yt_tutorial.dart/user.dart';

import '../models/survey_model.dart';
import 'package:http/http.dart' as http;

var client = http.Client();

Future<List<User>> getUserData() async {
  var response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  print("RESPONSE");
  print(response);
  print("RESPONSE");
  var jsonData = jsonDecode(response.body);
  print(jsonData);
  // print(jsonData);
  // var list = [];
  // list = jsonData.map<User>(User.fromJson).toList();
  // print(list);
  return jsonData.map<User>(User.fromJson).toList();

  // List<User> users = [];

  // for (var u in jsonData) {
  //   User user = User(
  //     name: u['name'],
  //     email: u['email'],
  //     userName: u['username'],
  //   );
  //   users.add(user);
  // }
  // print(users);
  // print(users.length);
  // return users;
}
