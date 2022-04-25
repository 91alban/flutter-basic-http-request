// import 'package:flutter/material.dart';
// import '../models/user_yt_tutorial.dart/user.dart';
// import 'dart:convert';
// import 'package:e_check_survey/models/user_yt_tutorial.dart/user.dart';
// import 'package:http/http.dart' as http;

// class Users with ChangeNotifier {
//   List<User> _users = [];

//   User findById(int id) {
//     return _users.firstWhere((user) => user.id == id);
//   }

//   var client = http.Client();

//   Future<void> getUserData() async {
//     try {
//       var response = await client
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//       print("RESPONSE");
//       print(response);
//       print("RESPONSE");
//       var jsonData = jsonDecode(response.body);
//       print(jsonData);
//       // print(jsonData);
//       // var list = [];
//       // list = jsonData.map<User>(User.fromJson).toList();
//       // print(list);
//       List<User> users = [];
//       users = jsonData.map<User>(User.fromJson).toList();
//       _users = users;
//       notifyListeners();
//     } catch (error) {
//       throw (error);
//     }
//     // List<User> users = [];

//     // for (var u in jsonData) {
//     //   User user = User(
//     //     name: u['name'],
//     //     email: u['email'],
//     //     userName: u['username'],
//     //   );
//     //   users.add(user);
//     // }
//     // print(users);
//     // print(users.length);
//     // return users;
//   }
// }
