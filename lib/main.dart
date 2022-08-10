import 'package:flutter/material.dart';
import 'package:start_web_app/pages/employeesPage.dart';
import 'package:start_web_app/pages/homePage.dart';
void main() {
  runApp(StartPoint());
}

class StartPoint extends StatelessWidget {
  const StartPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner:false,
        home: EmployeesPage(),

    );
  }
}
