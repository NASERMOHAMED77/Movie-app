import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizapp/screens/quizscreen/Q.dart';
import 'package:quizapp/screens/quizscreen/result.dart';

class FpQuiz extends StatefulWidget {
  const FpQuiz({Key? key}) : super(key: key);

  @override
  State<FpQuiz> createState() => _FpQuizState();
}

class _FpQuizState extends State<FpQuiz> {
  var i = 0;
  String x = '';
  int result = 0;
  final useranswer = [];
  final List trueanswers = [
    'Zamalek',
    'Zamalek',
    'Zamalek',
    'Zizo',
    'Zizo',
    'Benzema',
    'Awad',
    'Mendy',
    'Mendy',
    'amam ashowr'
  ];
  final List<Map<String, Object>> Qustion = [
    {
      'Q': 'What is the best club in Egypt',
      'A': ['Alahly', 'Zamalek', 'Prymids', 'Tanta']
    },
    {
      'Q': 'What is the best club in Africa',
      'A': ['Alahly', 'Zamalek', 'ELtargy Eltonesy', 'ElWedad']
    },
    {
      'Q': 'What is the best club in World',
      'A': ['Alahly', 'RealMadrid', 'Zamalek', 'Barcalona']
    },
    {
      'Q': 'Who is the best player in Egypt',
      'A': ['Zizo', 'Ramadan Sobhi', 'Shika', 'Emam Ashour']
    },
    {
      'Q': 'Who is the best player in africa',
      'A': ['Zizo', 'Salah', 'Mane', 'Ashraf Hakemy']
    },
    {
      'Q': 'Who is the best player in World',
      'A': ['Salah', 'Benzema', 'Cr7', 'Messi']
    },
    {
      'Q': 'Who is the best GoalKeaper in Egypt',
      'A': ['Awad', 'A elshenawy', 'M elshenawy', 'Awad Tany']
    },
    {
      'Q': 'Who is the best GoalKeaper in Africa',
      'A': ['Awad', 'Mendy', 'M Elshanawy']
    },
    {
      'Q': 'Who is the best GoalKeaper in World',
      'A': ['Awad', 'Cortoua', 'Alisson', 'Mendy']
    },
    {
      'Q': 'Who is the best playmaker in Egypt',
      'A': ['A alsaid', 'obama', 'amam ashowr', 'Afsha']
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Qustions(
            text: Qustion[i]['Q'].toString(),
          ),
          ...(Qustion[i]['A'] as List<String>).map((e) {
            return Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (trueanswers[i] == e) {
                    result = result + 10;
                    print(result);
                    print(e);
                  }
                  print(e);
                  print(trueanswers[i]);
                  if (result > 80) {
                    x = 'images/z.png';
                  }
                  if (result < 50) {
                    x = 'images/best.png';
                  }
                  setState(() {
                    if (i < 9) {
                      i++;
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResulPage(
                                    result: result,
                                    //image: x,
                                  )));
                    }
                  });
                  print(i);
                },
                child: Text(
                  e,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
