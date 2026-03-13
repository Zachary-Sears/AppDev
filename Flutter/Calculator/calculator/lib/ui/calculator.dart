import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Display(),
            Divider(
              color: Colors.deepPurple,
              indent: 15,
              endIndent: 15,
              thickness: 2.5,
              radius: BorderRadius.all(Radius.circular(5)),
            ),
            ButtonMatrix(),
          ],
        ),
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(25, 150, 25, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 75, fontFamily: 'NanumGothicCoding'),
          ),
        ],
      ),
    );
  }
}

class ButtonMatrix extends StatelessWidget {
  const ButtonMatrix({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(25, 5, 25, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  'C',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Icon(Icons.backspace, size: 50),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Icon(Icons.history_rounded, size: 50),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '/',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(25, 5, 25, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '2',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  'X',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(25, 5, 25, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '4',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '5',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '6',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(25, 5, 25, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '7',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '8',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '9',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(25, 5, 25, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '+/-',
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '.',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5);
                    }
                    return null; // Use the component's default.
                  }),
                ),
                child: Text(
                  '=',
                  style: TextStyle(
                    fontSize: 75,
                    fontFamily: 'NanumGothicCoding',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
