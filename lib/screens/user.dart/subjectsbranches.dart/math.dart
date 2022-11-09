import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizapp/screens/user.dart/mathexplain.dart';

class MathBranches extends StatefulWidget {
  const MathBranches({Key? key}) : super(key: key);

  @override
  State<MathBranches> createState() => _MathBranchesState();
}

class _MathBranchesState extends State<MathBranches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 100),
                child: Center(
                  child: Container(
                    height: 150,
                    width: 2000,
                    child: Image.asset('images/x.png'),
                  ),
                ),
              ),
              MaterialButton(
                  onPressed: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MathEx()));
                  }),
                  child: SubjectBranch(image: 'images/m1.png'))
            ],
          ),
        ));
  }
}

class SubjectBranch extends StatelessWidget {
  const SubjectBranch({Key? key, required this.image}) : super(key: key);

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
