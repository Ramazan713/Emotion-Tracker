import 'package:flutter/material.dart';

class QuoteContentText extends StatelessWidget {
  final String? content;

  const QuoteContentText({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          children: [
            getBracketSpan(),
            TextSpan(
                text: content ?? "",
                style: const TextStyle(
                    fontFamily: "Ic",
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22
                )
            ),
            getBracketSpan(),
          ]
      ),
    );
  }

  TextSpan getBracketSpan(){
    return TextSpan(
        text: content != null ? '”' : "",
        style: const TextStyle(
            fontFamily: "Ic",
            fontWeight: FontWeight.w700,
            color: Colors.green,
            fontSize: 30
        )
    );
  }

}
