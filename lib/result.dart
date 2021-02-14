import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function p;
  final resultScore;

  Result(this.p, this.resultScore);

  String get resultPhares {
    String resultText;
    if (resultScore >= 70) {
      resultText = "You are Awsome!";
    } else if (resultScore >= 40) {
      resultText = "Good!";
    } else {
      resultText = "You are so bad!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You're score is :$resultScore",
            style:
                TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: b),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhares,
            style:
                TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: b),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              onPressed: p,
              child: Text(
                'Restart The App',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ))
        ],
      ),
    );
  }
}
