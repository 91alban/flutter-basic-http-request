import 'package:e_check_survey/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      // ChangeNotifierProvider(
      //   create: (context) => Users(),
      //   child: const MyApp(),
      // ),
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
