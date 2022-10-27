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
  final _questions = [
    {
      'type': 'frq',
      'question': 'What is your name?',
    },
    {
      'type': 'mcq',
      'question': 'What is your favorite language?',
      'answers': [
        'Java',
        'Python',
        'Dart',
        'English',
      ],
    },
    {
      'type': 'mcq',
      'question': 'What season were you born in?',
      'answers': [
        'Summer',
        'Winter',
        'Spring',
        'Fall',
      ],
    },
  ];

  final data = {
    "title": "Questionaire",
    "resultTitle": "Results",
  };

  var _questionIndex = 0;

  var responses = [];

  void _answerQuestion(String answer) {
    responses.add(answer);
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _formSubmit(String answer) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    responses.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data["title"].toString()),
        ),
        body: Container(
            child: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    formSubmit: _formSubmit,
                    questionIndex: _questionIndex)
                : Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          data["resultTitle"].toString(),
                          style: const TextStyle(fontSize: 28),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      for (var response in responses)
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            response,
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  )));
  }
}
