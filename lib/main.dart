import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  bool isSwitched = false;

  int num0 = 0, num1 = 0, num2 = 0;

  void answerQuestion(score) {
    // if (_questionIndex == 1) {
    //   _questionIndex = -1;
    // }
    //num = score;
    if (_questionIndex == 0)
      num0 = score;
    else if (_questionIndex == 1)
      num1 = score;
    else if (_questionIndex == 2) num2 = score;
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print("_questionIndex = $_questionIndex");
    print("num = $num");
    print(_totalScore);
    print("answer choosen");
  }

  void _restartQuiz() {
    setState(() {});
    _questionIndex = 0;
    _totalScore = 0;
    num0 = 0;
    num1 = 0;
    num2 = 0;
  }

  final List<Map<String, Object>> _question = [
    {
      'questionText': ' what\'s your favorite color? ',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40}
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephent', 'score': 30},
        {'text': 'Lion', 'score': 40}
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Quiz App",
              style: TextStyle(color: w),
            ),
            actions: [
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                    if (isSwitched == true) {
                      b = Colors.white;
                      w = Colors.black;
                    } else {
                      b = Colors.black;
                      w = Colors.white;
                    }
                  });
                },
                activeColor: Colors.white,
                //inactiveThumbColor: Colors.yellow,
                inactiveThumbColor: Colors.black,
                // inactiveTrackColor: Colors.red,
                inactiveTrackColor: Colors.black,
              ),
            ],
          ),
          body: Container(
            color: w,
            padding: EdgeInsets.all(25),
            child: _questionIndex < _question.length
                ? Quiz(_question, _questionIndex, answerQuestion)
                // Answer(answerQuestion, "Answer1"),
                // Answer(answerQuestion, "Answer2"),
                // Answer(answerQuestion, "Answer3"),
                // Answer(answerQuestion, "Answer4")

                : Result(_restartQuiz, _totalScore),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (_questionIndex == 0) _totalScore -= num0;
              if (_questionIndex == 1) _totalScore -= num1;
              if (_questionIndex == 2) _totalScore -= num2;
              // _totalScore -= num;
              setState(() {
                if (_questionIndex > 0) _questionIndex--;
              });
              print("_questionIndex = $_questionIndex");
              print("num = $num");
              print(_totalScore);
            },
            child: Icon(
              Icons.arrow_back,
              color: w,
              size: 40,
            ),
          ),
        ));
  }
}
