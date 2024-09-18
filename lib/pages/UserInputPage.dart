import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/providers/user-provider.dart';
import '/models/user.dart';

class UserPage extends StatefulWidget {
  static const id = "use page";
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  // Метод для сохранения данных в Firebase Firestore
  Future<void> _saveUserToFirestore(User user) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(user.toMap());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User saved successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving user: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Surname'),
            ),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(labelText: 'Department'),
            ),
            TextField(
              controller: _positionController,
              decoration: InputDecoration(labelText: 'Position'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Создаем нового пользователя
                User newUser = User(
                  name: _nameController.text,
                  surname: _surnameController.text,
                  department: _departmentController.text,
                  position: _positionController.text,
                );

                // Сохраняем данные в Firebase
                _saveUserToFirestore(newUser);

                // Обновляем данные в провайдере
                userProvider.setUser(newUser);
              },
              child: Text('Save User'),
            ),
          ],
        ),
      ),
    );
  }
}
