import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/auth/loginwithgoogle.dart';
import 'package:quizapp/screens/logintoapp/forgetpassword.dart';
import 'package:quizapp/screens/logintoapp/singuppage.dart';
import 'package:quizapp/screens/quizscreen/fristpquiz.dart';
import 'package:quizapp/screens/user.dart/usermenu.dart';

import '../../Constant/componat.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userEmail = TextEditingController();
  var userPass = TextEditingController();
  final navigatorkey = GlobalKey<NavigatorState>();
  bool check = false;
  GlobalKey<FormState> foormkey = GlobalKey<FormState>();

  bool x = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider(
            create: (context) => LoginWithGoogle(),
            builder: (context, child) => StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('SomeThing Went Wrong'),
                      );
                    } else if (snapshot.hasData) {
                      return UserPage();
                    } else {
                      return LoginWidget(context);
                    }
                  }),
                )));
  }

  SingleChildScrollView LoginWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: foormkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Container(
                  height: 150,
                  width: 2000,
                  child: Image.asset('images/x.png'),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            DefultFormField(
              validate: (value) {
                if (value != null && !EmailValidator.validate(value)) {
                  return 'Enter Correct Email ';
                }
              },
              textcontroller: userEmail,
              hinttext: 'Enter Your email',
              labeltext: 'Email',
              icondata: Icons.email,
              keyboard: TextInputType.emailAddress,
              hidepass: false,
            ),
            SizedBox(
              height: 20,
            ),
            DefultFormField(
              validate: (value) {
                if (value.toString().length < 6) {
                  return 'password must be more than 6 digits';
                }
              },
              textcontroller: userPass,
              hinttext: 'Enter Your PassWord',
              labeltext: 'PassWord',
              icondata: Icons.remove_red_eye,
              keyboard: TextInputType.visiblePassword,
              hidepass: true,
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  const Text(
                    'Remeber your password ? ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'Click here',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassWord()));
                    }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7,
                      color: Colors.black.withOpacity(.2),
                      offset: Offset(
                        10,
                        10,
                      ),
                      spreadRadius: 1)
                ],
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.amber,
                onPressed: () {
                  if (foormkey.currentState!.validate()) {}

                  signin();
                  check ? print('yes') : print('no');
                  if (check == false) {
                    final snake = SnackBar(
                        backgroundColor: Colors.amber,
                        content: Text('Email or PassWord is Wrong'));
                    ScaffoldMessenger.of(context).showSnackBar(snake);
                  }
                  setState(() {});
                },
                child: const Text(
                  'Sing In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 7,
                      color: Colors.black.withOpacity(.2),
                      offset: Offset(
                        10,
                        10,
                      ),
                      spreadRadius: 1)
                ],
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.amber,
                onPressed: () {
                  signInWithGoogle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Sing In With Google',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  const Text(
                    'Don\'t have an account ? ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'Sing Up',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SginUpPage()));
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signin() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: userEmail.text.trim(), password: userPass.text.trim())
          .then((value) {
        check = true;
        setState(() {});
      }).catchError(() {
        check = false;
        setState(() {});
      });
    } catch (e) {
      check = false;
      setState(() {});
    }
    Navigator.of(context).pop();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
