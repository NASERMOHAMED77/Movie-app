import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard(
      {Key? key,
      required this.text,
      required this.image,
      required this.ButtonPressed})
      : super(key: key);
  final String text;
  final Function ButtonPressed;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage('images/bk1.png'), fit: BoxFit.cover),
        // color: Colors.amber,
        // gradient: LinearGradient(colors: [
        //   Colors.white70,
        //   Colors.amber,
        //   Colors.amber,
        //   Colors.white70,
        // ]),
      ),
      child: MaterialButton(
        onPressed: () {
          ButtonPressed();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.amber[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
