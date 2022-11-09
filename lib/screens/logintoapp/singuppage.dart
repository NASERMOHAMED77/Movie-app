import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizapp/Constant/componat.dart';
import 'package:quizapp/screens/logintoapp/loginpage.dart';
import 'package:quizapp/screens/user.dart/usermenu.dart';

class SginUpPage extends StatefulWidget {
  const SginUpPage({Key? key}) : super(key: key);

  @override
  State<SginUpPage> createState() => _SginUpPageState();
}

GlobalKey<FormState> singupokey = GlobalKey<FormState>();
var firstname = TextEditingController();
final userEmail = TextEditingController();
final userPass = TextEditingController();
var lastname = TextEditingController();
bool check = true;
var phone = TextEditingController();

class _SginUpPageState extends State<SginUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
                key: singupokey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            child: Image.asset('images/x.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      DefultFormField(
                        textcontroller: firstname,
                        hinttext: 'enter yor firstname',
                        labeltext: 'first  Name',
                        icondata: Icons.person,
                        keyboard: TextInputType.name,
                        hidepass: false,
                        validate: (value) {
                          if (value.toString().isEmpty) {
                            return 'firstName must not be empty ';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefultFormField(
                        validate: (value) {
                          if (value.toString().isEmpty) {
                            return 'lastName must not be empty ';
                          }
                        },
                        textcontroller: lastname,
                        hinttext: 'enter yor lastname',
                        labeltext: 'last Name',
                        icondata: Icons.person,
                        keyboard: TextInputType.name,
                        hidepass: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DefultFormField(
                          validate: (value) {
                            if (value != null &&
                                !EmailValidator.validate(value)) {
                              return 'Enter a valid Email ';
                            }
                          },
                          textcontroller: userEmail,
                          hinttext: 'enter yor email',
                          labeltext: 'Email',
                          icondata: Icons.email_outlined,
                          keyboard: TextInputType.emailAddress,
                          hidepass: false),
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
                          hinttext: 'enter yor password',
                          labeltext: 'PassWord',
                          icondata: Icons.lock_outline_rounded,
                          keyboard: TextInputType.visiblePassword,
                          hidepass: true),
                      SizedBox(
                        height: 20,
                      ),
                      DefultFormField(
                          validate: (value) {
                            if (value.toString().length < 11) {
                              return 'password must be digits';
                            }
                          },
                          textcontroller: phone,
                          hinttext: 'enter yor phone',
                          labeltext: 'Phone',
                          icondata: Icons.phone,
                          keyboard: TextInputType.phone,
                          hidepass: false),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(10),
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
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            if (singupokey.currentState!.validate()) {
                              final snackbar = SnackBar(
                                  content: Text('Email Created Succesfully'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserPage()));
                            }

                            singup();
                            if (check == false) {
                              final snackbar = SnackBar(
                                  backgroundColor: Colors.amber,
                                  content: Text('Email or password  is wrong'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            }
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 23, vertical: 7),
                        child: Row(
                          children: [
                            const Text(
                              'Already have an account ? ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                              // ignore: sort_child_properties_last
                              child: const Text(
                                'Sing in',
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              }),
                            )
                          ],
                        ),
                      ),
                    ]))));
  }

//   Future singup() async {
//     try {
//       final User? user = await FirebaseAuth.instance.currentUser;
//       final uid = user?.uid;
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: userEmail.text,
//         password: userPass.text,
//       );
//       {
//         print('x');
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }
// }

  Future singup() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator());
        });
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userEmail.text.trim(), password: userPass.text.trim())
        .then((value) {
      check = true;
      setState(() {});
    }).catchError(() {
      check = false;
      setState(() {});
    });
    Navigator.of(context).pop();
  }
}
