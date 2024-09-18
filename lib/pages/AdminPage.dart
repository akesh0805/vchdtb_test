import 'package:flutter/material.dart';
import 'package:vchdtb_test/pages/AddTestPage.dart';
import 'package:vchdtb_test/pages/test_list_page.dart';

class AdminPage extends StatefulWidget {
  static const id = "Admin Page";
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddTestPage.id);
              },
              child: Text("Test qo'shish"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, TestListPage.id);
              },
              child: Text("Testlarni tahrirlash"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Test natijalarini ko'rish"),
            ),
          ],
        ),
      ),
    );
  }
}
