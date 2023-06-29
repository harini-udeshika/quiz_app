import 'package:flutter/material.dart';
import 'package:quiz_app/quizBrain.dart';
import 'package:quiz_app/scoreKeeper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz Page',
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 44, 43, 43),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: SafeArea(child: QuizPage()),
          )),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizbrain = QuizBrain();

  ScoreKeeper scoreKeeper = ScoreKeeper();
  void alert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "THE END",
      desc: "You've reached the end of the game",
      buttons: [
        DialogButton(
          child: Text(
            "Play again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 4,
              child: Center(
                  child:
                      Text(quizbrain.getQuestion(quizbrain.getQuestionCount()),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          )))),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    if (!quizbrain.getFlag()) {
                      if (quizbrain.checkQuestion()) {
                        scoreKeeper.correct();
                      } else {
                        scoreKeeper.wrong();
                      }
                    } else {
                      alert();
                      quizbrain.reset();
                      scoreKeeper.resetmarkers();
                    }
                  });
                },
                child: Text('True')),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    if (!quizbrain.getFlag()) {
                      if (quizbrain.checkQuestion()) {
                        scoreKeeper.wrong();
                      } else {
                        scoreKeeper.correct();
                      }
                    } else {
                      alert();
                      quizbrain.reset();
                      scoreKeeper.resetmarkers();
                    }
                  });
                },
                child: Text('False')),
          )),
          Row(
            children: scoreKeeper.scoreKeepers,
          )
        ],
      ),
    );
  }
}
