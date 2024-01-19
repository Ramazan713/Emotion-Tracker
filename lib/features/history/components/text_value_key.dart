import 'package:flutter/material.dart';

class TextValueKey extends StatelessWidget {
  final String keyText;
  final String valueText;
  final TextStyle? textStyle;

  const TextValueKey({
    super.key,
    required this.keyText,
    required this.valueText,
    required this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: keyText,
          ),
          TextSpan(
            text: valueText,
            style: textStyle?.copyWith(
              fontWeight: FontWeight.w500
            )
          )
        ]
      ),
      style: textStyle,
    );
  }
}
