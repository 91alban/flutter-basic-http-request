import 'package:e_check_survey/models/user_yt_tutorial.dart/single_user.dart';
import 'package:e_check_survey/models/user_yt_tutorial.dart/user.dart';
import 'package:e_check_survey/services/json_call_tests.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/users_providers.dart';

class UserScreen extends StatefulWidget {
  final int userId;

  UserScreen({
    required this.userId,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<SingleUser> usersFuture = getSingleUser(widget.userId);

  @override
  Widget build(BuildContext context) {
    // final loadedUser = Provider.of<Users>(context).findById(userId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<SingleUser>(
          future: usersFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final singleSurvey = snapshot.data!;
              return Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(singleSurvey.name!),
                      subtitle: Text(singleSurvey.email!),
                    ),
                  ),
                ],
              );
            } else {
              return Text('${snapshot.error}');
            }
          },
        ),
      ),
    );
  }
}
