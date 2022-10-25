import 'package:dao_thesis/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Questionaire(),
  ));
}

class Questionaire extends StatefulWidget {
  const Questionaire({super.key});

  @override
  State<Questionaire> createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  var answers = [
    '1',
    '2',
    '3',
    '4',
  ];
  var data = [
    {
      'type': 'mcq',
      'question': 'who?',
      'answers': [
        '1',
        '2',
        '3',
        '4',
      ],
    },
    {
      'type': 'mcq',
      'question': 'jimbo?',
      'answers': [
        '5',
        '6',
        '7',
        '8',
      ],
    },
    {
      'type': 'frq',
      'question': 'frq?',
    }
  ];

  var _questionIndex = 0;

  var responses = [];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      // responses.add(answer);
    });
  }

  void _formSubmit() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      displayText = textController.text;
    });
  }

  TextEditingController textController = TextEditingController();
  String displayText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Questionaire"),
        ),
        body: Container(
            child: _questionIndex < data.length
                ? Quiz(
                    data: data,
                    answerQuestion: () => _answerQuestion,
                    formSubmit: () => _formSubmit,
                    questionIndex: _questionIndex)
                : Column(
                    children: [
                      for (var response in responses)
                        Column(
                          children: [
                            Text(response),
                          ],
                        )
                    ],
                  )));
  }
}
