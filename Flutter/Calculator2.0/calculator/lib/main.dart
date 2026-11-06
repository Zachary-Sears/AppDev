import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator/ui/display/models/calculator_model.dart';
import 'package:calculator/ui/display/widgets/btnMatrix.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const CalculatorContainer());
}

class CalculatorContainer extends StatefulWidget {
  const CalculatorContainer({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorContainerState();
}

class _CalculatorContainerState extends State<CalculatorContainer> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: MaterialApp(
        title: 'Calculator 2.0',
        theme: AppTheme.themeData,
        home: Scaffold(body: BtnMatrix(),)
        )
    );
  }
}