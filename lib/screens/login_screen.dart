import 'package:e_check_survey/screens/surveys/homepage_screen.dart';
import 'package:e_check_survey/screens/yt_tests.dart';
import 'package:flutter/material.dart';
import 'package:e_check_survey/services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ApiServices _auth = ApiServices();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String email = '';
  String password = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
            ),
            const SizedBox(
              height: 4,
            ),
            TextField(
              controller: passwordController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Password'),
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(
                  Icons.lock_open,
                  size: 32,
                ),
                label: const Text('Sign In'),
                onPressed: () async {
                  await _auth.userLogin(email, password);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageScreen()),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     const Text('Don\'t have an account yet?'),
            //     ElevatedButton.icon(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => SignUpScreen()),
            //         );
            //       },
            //       icon: const Icon(Icons.create),
            //       label: const Text('Sign up'),
            //     )
            //   ],
            // ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(
                  Icons.dangerous,
                  size: 32,
                ),
                label: const Text('Yt tests'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YtTests()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
