import 'package:flutter/material.dart';
import '/models/test.dart';

class TestDetailPage extends StatelessWidget {
  final Test test;

  TestDetailPage({required this.test});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(test.title),
      ),
      body: ListView.builder(
        itemCount: test.questions.length,
        itemBuilder: (context, index) {
          Question question = test.questions[index];
          return ListTile(
            title: Text('Question ${index + 1}: ${question.questionText}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(question.answers.length, (i) {
                return Text(
                  '${i + 1}. ${question.answers[i]}',
                  style: TextStyle(
                    fontWeight: i == question.correctAnswerIndex
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: i == question.correctAnswerIndex
                        ? Colors.green
                        : Colors.black,
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}