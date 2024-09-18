import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/providers/test_provider.dart';
import '/models/test.dart';

class AddTestPage extends StatefulWidget {
  static const id = "addtestpage";
  @override
  _AddTestPageState createState() => _AddTestPageState();
}

class _AddTestPageState extends State<AddTestPage> {
  final TextEditingController _titleController = TextEditingController();
  final List<Question> _questions = [];

  // Контроллеры для текущего вопроса
  final TextEditingController _questionTextController = TextEditingController();
  final List<TextEditingController> _answerControllers = List.generate(4, (_) => TextEditingController());
  int _correctAnswerIndex = 0;

  // Метод для сохранения теста в Firestore
  Future<void> _saveTestToFirestore(Test test) async {
    try {
      await FirebaseFirestore.instance.collection('tests').add(test.toMap());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Test saved successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving test: $e')),
      );
    }
  }

  // Добавление вопроса в список вопросов
  void _addQuestion() {
  setState(() {
    _questions.add(
      Question(
        questionText: _questionTextController.text,
        answers: _answerControllers.map((controller) => controller.text).toList(),
        correctAnswerIndex: _correctAnswerIndex,
      ),
    );
  });

  // Очистка полей после добавления
  _questionTextController.clear();
  _answerControllers.forEach((controller) => controller.clear());
  _correctAnswerIndex = 0;
}
  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Exam Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Test Title'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _questionTextController,
              decoration: InputDecoration(labelText: 'Question'),
            ),
            ...List.generate(4, (index) {
              return TextField(
                controller: _answerControllers[index],
                decoration: InputDecoration(labelText: 'Answer ${index + 1}'),
              );
            }),
            DropdownButton<int>(
              value: _correctAnswerIndex,
              items: List.generate(4, (index) {
                return DropdownMenuItem(
                  value: index,
                  child: Text('Correct Answer ${index + 1}'),
                );
              }),
              onChanged: (value) {
                setState(() {
                  _correctAnswerIndex = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: _addQuestion,
              child: Text('Add Question'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Test newTest = Test(
                  title: _titleController.text,
                  questions: _questions,
                );

                // Сохранение теста в Firebase
                _saveTestToFirestore(newTest);

                // Обновление провайдера
                testProvider.setTest(newTest);

              },
              child: Text('Save Test'),
            ),
          ],
        ),
      ),
    );
  }
}