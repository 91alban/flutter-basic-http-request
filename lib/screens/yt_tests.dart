import 'package:e_check_survey/screens/user_screen.dart';
import 'package:e_check_survey/services/json_call_tests.dart';
import 'package:flutter/material.dart';
import '../models/user_yt_tutorial.dart/user.dart';

class YtTests extends StatefulWidget {
  // YtTests({Key? key}) : super(key: key);

  @override
  State<YtTests> createState() => _YtTestsState();
}

class _YtTestsState extends State<YtTests> {
  Future<List<User>> usersFuture = getUserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Yt tests')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                child: Text('Click'),
                onPressed: () {
                  getUserData();
                },
              ),
            ),
            Container(
              height: 500,
              child: FutureBuilder<List<User>>(
                  future: usersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final users = snapshot.data!;
                      return buildUsers(users);
                    } else {
                      return const Text('Loading...');
                    }
                  }),
            )
            // FutureBuilder(
            //   builder: (context, AsyncSnapshot snapshot) {
            //     if (snapshot.data == null) {
            //       return const Center(
            //         child: Text('Loading...'),
            //       );
            //     } else {
            //       return ListView.builder(
            //         itemCount: snapshot.data.length,
            //         itemBuilder: (context, i) {
            //           return ListTile(
            //             title: Text(snapshot.data[i].name),
            //             subtitle: Text(snapshot.data[i].userName),
            //           );
            //         },
            //       );
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }

  Widget buildUsers(List<User> users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) {
          final user = users[i];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.userName),
            trailing: Text(user.street),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserScreen(
                          userId: user.id,
                        )),
              );
            },
          );
        },
      );
}
