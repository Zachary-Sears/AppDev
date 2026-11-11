import 'package:flutter/material.dart';

import 'package:calculator/ui/theme/theme.dart';

class DisplayDivider extends StatelessWidget{
  const DisplayDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.primaryColor,
      indent: AppSpacing.displayDividerIndent,
      endIndent: AppSpacing.displayDividerIndent,
      thickness: AppSpacing.displayDividerThickness,
      radius: BorderRadius.all(Radius.circular(5)),
    );
  }
}