import 'package:flutter/material.dart';
import 'package:quizapp/screens/logintoapp/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizapp/screens/user.dart/usermenu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final navigatorkey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      LoginPage(),
    );
  }
}
