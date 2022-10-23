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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Questionaire"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Hello",
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ), //Text
            ),
            for (var item in answers)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.white)),
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: Text(item),
                ),
              ),
          ],
        ));
  }
}
