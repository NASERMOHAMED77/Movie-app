import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// class EmailFieldForLogin extends StatefulWidget {
//   const EmailFieldForLogin({Key? key}) : super(key: key);

//   @override
//   State<EmailFieldForLogin> createState() => _EmailFieldForLoginState();
// }

// class _EmailFieldForLoginState extends State<EmailFieldForLogin> {
//   var userEmail = TextEditingController();
//   var userPass = TextEditingController();
//   final formkey = GlobalKey<FormState>();
//   bool x = true;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         width: double.infinity,
//         child: TextFormField(
//           validator: ((value) {
//             if (value!.isEmpty) {
//               return 'You Forget Enter Email ';
//             } else {
//               return null;
//             }
//           }),
//           decoration: InputDecoration(
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//               labelText: 'Email',
//               hintText: 'Enter Your Email ',
//               hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
//               suffixIcon: Icon(Icons.email_outlined),
//               labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
//           keyboardType: TextInputType.emailAddress,
//           controller: userEmail,
//         ),
//       ),
//     );
//   }
// }

class TextFeild extends StatelessWidget {
  final TextEditingController textcontroller;
  final String labeltext;
  final String hinttext;
  final IconData icondata;
  final TextInputType keyboard;
  final valdate;
  final bool hidepass;
  TextFeild({
    Key? key,
    required this.textcontroller,
    required this.hinttext,
    required this.labeltext,
    required this.icondata,
    required this.keyboard,
    required this.valdate,
    required this.hidepass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          validator: valdate(),
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: labeltext,
              hintText: hinttext,
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
              suffixIcon: Icon(icondata),
              labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          keyboardType: keyboard,
          obscureText: hidepass,
          controller: textcontroller,
        ),
      ),
    );
  }
}

// class ButtonApp extends StatelessWidget {
//   ButtonApp(
//       {Key? key, required this.x, required this.formkey, required this.textbt})
//       : super(key: key);
//   var formkey = GlobalKey<FormState>();
//   final String textbt;
//   final Function x;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       color: Colors.amber,
//       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 160),
//       onPressed: () {
//         x() {}

//         if (formkey.currentState!.validate()) {}
//       },
//       child: Text(
//         textbt,
//         style: TextStyle(
//             color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
//       ),
//     );
//   }
// }

// class ButtonAnswer extends StatelessWidget {
//   ButtonAnswer({
//     Key? key,
//     required this.textbt,
//     required this.onpressed,
//   }) : super(key: key);
//   final String textbt;
//   var onpressed;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: MaterialButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         color: Colors.amber,
//         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 160),
//         onPressed: onpressed,
//         child: Text(
//           textbt,
//           style: TextStyle(
//               color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
//         ),
//       ),
//     );
//   }
// }

Padding topimage() {
  return Padding(
    padding: const EdgeInsets.only(top: 70, bottom: 50),
    child: Center(
      child: Container(
        height: 200,
        width: 200,
        child: Image.asset('images/x.png'),
      ),
    ),
  );
}

Widget DefultFormField(
        {@required validate,
        @required hinttext,
        @required keyboard,
        @required icondata,
        @required textcontroller,
        @required hidepass,
        @required labeltext}) =>
    Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          validator: (value) {
            return validate!(value);
          },
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              labelText: labeltext,
              hintText: hinttext,
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
              suffixIcon: Icon(icondata),
              labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          keyboardType: keyboard,
          obscureText: hidepass,
          controller: textcontroller,
        ),
      ),
    );
