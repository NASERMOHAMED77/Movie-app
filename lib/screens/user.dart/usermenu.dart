import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/screens/quizscreen/fristpquiz.dart';
import 'package:quizapp/screens/user.dart/mathexplain.dart';
import 'package:quizapp/screens/user.dart/subjectsbranches.dart/math.dart';
import 'package:quizapp/screens/user.dart/usermenuconstant.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.login_outlined,
              textDirection: TextDirection.ltr,
              color: Colors.amber,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Center(
                              child: Container(
                                height: 150,
                                width: 2000,
                                child: Image.asset('images/x.png'),
                              ),
                            ),
                          ),
                          // Text(
                          //   'نسعي دائما الي تقديم الافصل',
                          //   style: TextStyle(
                          //       fontSize: 20,
                          //       color: Colors.amber,
                          //       fontWeight: FontWeight.w700),
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Text(
                          //   'We strive to provide the best',
                          //   style: TextStyle(
                          //       fontSize: 20,
                          //       color: Colors.green.shade900,
                          //       fontWeight: FontWeight.w700),
                          // ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            // ignore: prefer_const_constructors
                            // Row(
                            //   children: [
                            //     MaterialButton(
                            //       onPressed: () {},
                            //       child: Subject(
                            //         image: 'images/aa.png',
                            //       ),
                            //     ),
                            //     MaterialButton(
                            //       onPressed: () {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) =>
                            //                     MathBranches()));
                            //       },
                            //       child: Subject(
                            //         image: 'images/ee.png',
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                                // MaterialButton(
                                //   onPressed: () {},
                                //   child: Subject(
                                //     image: 'images/ccc.png',
                                //   ),
                                // ),
                                // MaterialButton(
                                //   onPressed: () {},
                                //   child: Subject(
                                //     image: 'images/pp.png',
                                //   ),
                                // ),
                            //   ],
                            // ),
                            Container(
                              color: Colors.amber,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FpQuiz()));
                                },
                                child: Text('Quiz'),
                              ),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Subject extends StatelessWidget {
  const Subject({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 140,
      width: 150,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 7,
                color: Colors.black.withOpacity(.3),
                offset: Offset(
                  15,
                  10,
                ),
                spreadRadius: 1)
          ],
          color: Colors.amber,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
    );
  }
}
