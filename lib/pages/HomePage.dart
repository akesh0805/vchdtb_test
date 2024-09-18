import 'package:flutter/material.dart';
import 'package:vchdtb_test/pages/AdminPage.dart';
import 'package:vchdtb_test/pages/UserInputPage.dart';

class HomePage extends StatefulWidget {
  static const id = "HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("VCHD 4 TB TEST"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, UserPage.id);
              },
              child: Text("TEST TOPSHIRISH"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AdminPage.id);
              },
              child: Text("ADMIN"),
            ),
          ],
        ),
      ),
    );
  }
}
