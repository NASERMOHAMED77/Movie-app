import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizapp/screens/logintoapp/loginpage.dart';
import 'package:quizapp/screens/logintoapp/singuppage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool islogin = true;
  @override
  Widget build(BuildContext context) =>
    islogin ? LoginPage() : SginUpPage();
  }

