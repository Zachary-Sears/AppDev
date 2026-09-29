// import 'package:calculator/ui/calculator.dart';
import 'package:calculator/ui/widgets/btnMatrix.dart';

import 'ui/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp() /*const Calculator()*/);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: Scaffold(body: SafeArea(child: Btnmatrix()/*Center(child: Text('Hello World!'))*/)),
    );
  }
}
