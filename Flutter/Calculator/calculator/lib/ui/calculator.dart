import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(25, 100, 25, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '1+2=3',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 75,
                      fontFamily: 'NanumGothicCoding',
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              indent: 15,
              endIndent: 15,
              thickness: 2.5,
              radius: BorderRadius.all(Radius.circular(5)),
            ),
          ],
        ),
      ),
    );
  }
}
