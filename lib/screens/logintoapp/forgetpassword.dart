import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/Constant/componat.dart';

class ForgetPassWord extends StatefulWidget {
  const ForgetPassWord({Key? key}) : super(key: key);

  @override
  State<ForgetPassWord> createState() => _ForgetPassWordState();
}

class _ForgetPassWordState extends State<ForgetPassWord> {
  final userEmail = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              topimage(),
              DefultFormField(
                  validate: (value) {
                    if (value != null && !EmailValidator.validate(value)) {
                      return 'Enter Correct Email ';
                    }
                  },
                  textcontroller: userEmail,
                  hinttext: 'enter yor email',
                  labeltext: 'Email',
                  icondata: Icons.email_outlined,
                  keyboard: TextInputType.emailAddress,
                  hidepass: false),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    resetpass();

                    if (formkey.currentState!.validate()) {
                      final snackbar =
                          SnackBar(content: Text('Check Your Email'));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } else {}
                  },
                  child: Text(
                    'Reset PassWord',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future resetpass() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: userEmail.text.trim());
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
