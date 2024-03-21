import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      title: 'Personal Expense Tracker',
      home: HomePage(),
    );
  }
}
