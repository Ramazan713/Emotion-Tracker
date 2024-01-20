import 'package:flutter/material.dart';

class QuoteAuthorText extends StatelessWidget {
  final String? author;

  const QuoteAuthorText({
    super.key,
    required this.author
  });

  @override
  Widget build(BuildContext context) {
    final text = author == null || author?.isEmpty == true ? "" : "\n$author";
    return Text(text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontFamily: "Ic",
          color: Colors.white,
          fontSize: 18
      )
    );
  }
}
