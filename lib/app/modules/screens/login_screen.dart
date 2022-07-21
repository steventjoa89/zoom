import 'package:flutter/material.dart';
import 'package:zoom/app/auth/auth_methods.dart';
import 'package:zoom/app/widgets/custom_button.dart';
import 'package:zoom/app/widgets/custom_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: const Text(
              'Start a Meeting!',
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: const Text(
              'Start or join a video meeting on the go.',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.network(
                'https://img.freepik.com/free-vector/online-meetup-abstract-concept-vector-illustration-conference-call-join-meetup-group-video-call-online-service-distance-communication-informal-meeting-members-networking-abstract-metaphor_335657-2920.jpg?w=360'),
          ),
          CustomLoginButton(
            text: 'Google Sign In',
            onPress: () async {
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
