import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vchdtb_test/pages/TestDetailPage.dart';
import '/models/test.dart';

class TestListPage extends StatelessWidget {
  static const id = "testlistpage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tests').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No tests available.'));
          }

          // Преобразуем данные из Firebase в список объектов Test
          List<Test> tests = snapshot.data!.docs.map((doc) {
            return Test.fromMap(doc.data() as Map<String, dynamic>, doc.id);
          }).toList();

          return ListView.builder(
            itemCount: tests.length,
            itemBuilder: (context, index) {
              Test test = tests[index];

              return ListTile(
                title: Text(test.title),
                subtitle: Text('${test.questions.length} questions'),
                onTap: () {
                  // Можно добавить обработку нажатия на тест, например, переход на страницу деталей
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestDetailPage(test: test),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}