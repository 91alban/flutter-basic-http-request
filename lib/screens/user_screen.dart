import 'package:e_check_survey/models/user_yt_tutorial.dart/user.dart';
import 'package:e_check_survey/services/json_call_tests.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/users_providers.dart';

class UserScreen extends StatelessWidget {
  Future<List<User>> usersFuture = getUserData();
  final int userId;

  UserScreen({
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    // final loadedUser = Provider.of<Users>(context).findById(userId);
    return Scaffold(
      appBar: AppBar(title: Text('Single User Screen ')),
      // appBar: AppBar(title: Text('Single User Screen ${loadedUser.name}')),
    );
  }
}
