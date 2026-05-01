import 'package:flutter/material.dart';
import 'package:merckfoundation_252026/Utils/customcolor.dart';
Widget dynamicHighlightTitle({
  required String text,
  int normalWordCount = 2,
  bool highlightBracket = false,
}) {
  // 👉 Case 1: Bracket highlight (highest priority)
  if (highlightBracket) {
    final match = RegExp(r'(.*?)(\s*\(.*\))').firstMatch(text);

    if (match != null) {
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: match.group(1),
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: match.group(2),
              style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    }
  }

  // 👉 Case 2: Word-based highlight
  final words = text.split(" ");

  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: List.generate(words.length, (index) {
        final word = index == words.length - 1
            ? words[index]
            : "${words[index]} ";

        return TextSpan(
          text: word,
          style: TextStyle(
            color: index < normalWordCount ? Colors.black : Colors.pink,
            fontWeight: FontWeight.w600,
          ),
        );
      }),
    ),
  );
}