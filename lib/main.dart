import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

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
          backgroundColor: Colors.grey, body: SafeArea(child: QuizPage())),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int i = 0;
  int flag = 0;
  List<Icon> scoreKeepers = [];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<String> answers = ['False', 'True', 'True'];
  void correct() {
    scoreKeepers.add(const Icon(
      Icons.check,
      color: Colors.green,
    ));
  }

  List<Question> questionList = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];

  void wrong() {
    scoreKeepers.add(const Icon(
      Icons.close,
      color: Colors.red,
    ));
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
                  child: Text(questionList[i].question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
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
                    if (i <= questionList.length - 1 && flag == 0) {
                      if (questionList[i].answer == true) {
                        correct();
                      } else if (questionList[i].answer == false) {
                        wrong();
                      }
                      if (i != questionList.length - 1) {
                        i += 1;
                      } else {
                        flag++;
                      }
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
                    if (i <= questionList.length - 1 && flag == 0) {
                      if (questionList[i].answer == true) {
                        wrong();
                      } else if (questionList[i].answer == false) {
                        correct();
                      }
                      if (i != questionList.length - 1) {
                        i += 1;
                      } else {
                        flag++;
                      }
                    }
                  });
                },
                child: Text('False')),
          )),
          Row(
            children: scoreKeepers,
          )
        ],
      ),
    );
  }
}
