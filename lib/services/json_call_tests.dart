import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_check_survey/models/user_yt_tutorial.dart/single_user.dart';
import 'package:e_check_survey/models/user_yt_tutorial.dart/user.dart';

var client = http.Client();
final String url = 'https://jsonplaceholder.typicode.com/';

Future<List<User>> getUserData() async {
  var response = await client.get(Uri.parse('${url}users'));
  var jsonData = jsonDecode(response.body);

  // var list = [];
  // list = jsonData.map<User>(User.fromJson).toList();

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

  // return users;
}

// get a single user
Future<SingleUser> getSingleUser(userId) async {
  print('Userrrrrr iddd ${userId}');
  var response =
      await client.get(Uri.parse('${url}users/${userId.toString()}'));
  var jsonData = jsonDecode(response.body);
  print("single user dataaaa: ${jsonData}");
  return SingleUser.fromJson(jsonData);
}
