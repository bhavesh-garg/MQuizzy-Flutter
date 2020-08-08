import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'MeQuiz',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int rightCount = 0;
  int wrongCount = 0;

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        var alertStyle = AlertStyle(
          animationType: AnimationType.fromTop,
          isOverlayTapDismiss: false,
          isCloseButton: false,
          descStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          animationDuration: Duration(milliseconds: 400),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          titleStyle: TextStyle(
            color: Colors.purpleAccent,
          ),
        );
        Alert(
          context: context,
          type: AlertType.success,
          style: alertStyle,
          title: "Quiz Completed",
          desc: "Right Ans = $rightCount\nWrong Ans = $wrongCount ",
          buttons: [
            DialogButton(
              child: Text(
                "Exit",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => exit(0),
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "RESTART",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  quizBrain.reset();
                  scoreKeeper.removeRange(0, scoreKeeper.length);
                  rightCount = 0;
                  wrongCount = 0;
                  Navigator.pop(context);
                });
//
              },
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )
          ],
        ).show();
      } else {
        if (identical(userPickedAnswer, correctAnswer)) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          rightCount++;
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          wrongCount++;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text(
                quizBrain.getOp1(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(quizBrain.getOp1());
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.cyan,
              child: Text(
                quizBrain.getOp2(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(quizBrain.getOp2());
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                quizBrain.getOp3(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(quizBrain.getOp3());
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.cyan,
              child: Text(
                quizBrain.getOp4(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(quizBrain.getOp4());
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
