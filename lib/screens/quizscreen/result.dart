import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResulPage extends StatelessWidget {
  ResulPage({Key? key, required this.result})
      : super(key: key);
  int result;
  //String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                height: 150,
                width: 2000,
                child: Image.asset('images/x.png'),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Your Score :$result',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 100.0),
          //     child: Container(
          //       height: 150,
          //       width: 2000,
          //       child: Image.asset(image),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
