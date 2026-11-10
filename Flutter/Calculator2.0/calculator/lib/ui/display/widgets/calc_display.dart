import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/ui/display/models/calculator_model.dart';
import 'package:calculator/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    var displayAppState = context.watch<CalculatorModel>();

    var currentDisplayText = displayAppState.displayText;

    return Container(
        constraints: BoxConstraints(minWidth: 411, minHeight: 110),
        child: Center(
          child: Align(
            alignment: AlignmentGeometry.centerRight,
            child: AutoSizeText(
              currentDisplayText,
              style: AppTheme.textTheme.displayLarge,
              minFontSize: 35,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
  }
}