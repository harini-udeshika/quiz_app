import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List<Icon> scoreKeepers = [];
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
                  child: Text("This is where the question text will go",
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                    scoreKeepers.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
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
                    scoreKeepers.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
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
