import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen(int id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single User Screen')),
    );
  }
}
