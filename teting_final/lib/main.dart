import 'package:flutter/material.dart';
import 'question_class.dart';
import 'colors.dart';
// import "package:rflutter_alert/rflutter_alert.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestingScreen(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestingScreen extends StatefulWidget {
  TestingScreen({Key key, String title}) : super(key: key);

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  QuestionBank questionBank = QuestionBank();
  int questionIndex = 0;
  bool correctAnswer;
  void updateQuestion(bool userChoise) {
    if (userChoise == correctAnswer) {
      setState(() {
        scoreIcon.add(
          Icon(
            Icons.check,
            size: 30.0,
            color: Colors.green,
          ),
        );
        questionIndex++;
        score++;
        lasdtQuestion();
      });
    } else {
      setState(() {
        scoreIcon.add(Icon(
          Icons.close,
          size: 30.0,
          color: Colors.red,
        ));
        questionIndex++;
        score++;
        lasdtQuestion();
      });
    }
  }

  void lasdtQuestion() {
    if (questionIndex == questionBank.questionBrain.length) {
      setState(() {
        alert();
        questionIndex = 0;
        scoreIcon = [];
      });
    }
  }

  int score = 0;
  void alert() {
    Alert(
            context: context,
            title: "RFLUTTER",
            desc:
                "Сиздин балл $score ощол ${questionBank.questionBrain.length}")
        .show();
  }

  List<Icon> scoreIcon = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      questionBank.questionBrain[questionIndex].questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      correctAnswer = questionBank
                          .questionBrain[questionIndex].questionAnswer;
                      updateQuestion(true);
                    },
                    child: Text(
                      'Ооба',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      correctAnswer = questionBank
                          .questionBrain[questionIndex].questionAnswer;
                      updateQuestion(false);
                    },
                    child: Text(
                      'Жок',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                ),
                Row(
                  children: scoreIcon,
                )
              ]),
        )),
      ),
    );
  }
}

Alert({BuildContext context, String title, String desc}) {}
