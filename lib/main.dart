import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vchdtb_test/models/user.dart';
import 'package:vchdtb_test/pages/AddTestPage.dart';
import 'package:vchdtb_test/pages/AdminPage.dart';
import 'package:vchdtb_test/pages/HomePage.dart';
import 'package:vchdtb_test/pages/TestPage.dart';
import 'package:vchdtb_test/pages/UserInputPage.dart';
import 'package:vchdtb_test/pages/test_list_page.dart';
import 'package:vchdtb_test/providers/test_provider.dart';
import 'package:vchdtb_test/providers/user-provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDLGWZrq0zvfLfRIuRLP6EDcIEBTD2-tuc",
      appId: "1:202404407490:web:14fa926955c93b8e80335b",
      messagingSenderId: "202404407490",
      projectId: "vchdtb-test",
    ),
  );
  print("serverga ulandi");
  runApp(const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TestProvider()),
        ChangeNotifierProvider(create: (_)=>UserProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VCHD TB TEST',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(),
        routes: {
          HomePage.id: (context) => HomePage(),
          AdminPage.id: (context) => AdminPage(),
          AddTestPage.id: (context) => AddTestPage(),
          TestListPage.id: (context) => TestListPage(),
          UserPage.id: (context)=>UserPage(),
          // TestPage.id:(context)=> TestPage(),
        },
      ),
    );
  }
}
