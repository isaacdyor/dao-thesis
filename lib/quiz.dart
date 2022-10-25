import 'package:dao_thesis/answer.dart';
import 'package:dao_thesis/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> data;
  final int questionIndex;
  final Function answerQuestion;
  final Function formSubmit;

  Quiz({
    Key? key,
    required this.data,
    required this.answerQuestion,
    required this.formSubmit,
    required this.questionIndex,
  }) : super(key: key);

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(data[questionIndex]['question'].toString()),
      if (data[questionIndex]['type'].toString() == 'mcq')
        // for (var answer in data[questionIndex]['answers'] as List<String>)
        //   Answer(
        //     () => answerQuestion(answer.toString()),
        //     answer.toString(),
        //   ),
        ...(data[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(() => answerQuestion(), answer.toString());
        }).toList(),
      if (data[questionIndex]['type'].toString() == 'frq')
        Column(children: [
          TextField(
            controller: textController,
            maxLines: null,
          ),
          ElevatedButton(onPressed: formSubmit(), child: const Text("Submit")),
        ]),
    ]); //Column
  }
}
