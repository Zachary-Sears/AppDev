import 'package:calculator/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSpacing.displayTopPadding,
        bottom: AppSpacing.displayBottomPadding,
      ),
      child: Container(
        constraints: BoxConstraints(minWidth: 411, minHeight: 110),
        child: Center(
          child: Align(
            alignment: AlignmentGeometry.centerRight,
            child: AutoSizeText(
              "",
              style: TextTheme.of(context).displayLarge,
              minFontSize: 35,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
