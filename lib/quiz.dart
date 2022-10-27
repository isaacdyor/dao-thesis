import 'package:dao_thesis/answer.dart';
import 'package:dao_thesis/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final Function formSubmit;

  Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.formSubmit,
    required this.questionIndex,
  }) : super(key: key);

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[questionIndex]['question'].toString()),
      if (questions[questionIndex]['type'].toString() == 'mcq')
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer.toString());
        }).toList(),
      if (questions[questionIndex]['type'].toString() == 'frq')
        Column(children: [
          SizedBox(
            width: 500.0,
            child: TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              controller: textController,
              maxLines: null,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => formSubmit(textController.text),
              child: const Text("Submit")),
        ]),
    ]);
  }
}
