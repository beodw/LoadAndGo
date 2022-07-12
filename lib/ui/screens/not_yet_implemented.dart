import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class NotYetImplemented extends StatelessWidget {
  final Duration _duration = const Duration(milliseconds: 250);

  const NotYetImplemented({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        repeatForever: true,
        animatedTexts: [
          TyperAnimatedText('Not Yet Implemented.',
              textStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w100,
                  fontSize: 25),
              speed: _duration),
        ],
      ),
    );
  }
}
