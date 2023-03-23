import 'package:flutter/material.dart';
import 'package:github_user/ui/screens/dahboard_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: DashboardPages(),
    );
  }
}


