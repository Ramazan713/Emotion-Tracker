import 'package:flutter/material.dart';

class EmotionItem extends StatelessWidget {
  final String name;
  final bool isPositive;
  final void Function() onClick;
  final EdgeInsets? margins;

  const EmotionItem({
    super.key,
    required this.name,
    required this.isPositive,
    required this.onClick,
    this.margins
  });

  @override
  Widget build(BuildContext context) {
    final color = isPositive ? Colors.blue : Colors.red;

    return Padding(
      padding: margins ?? EdgeInsets.zero,
      child: OutlinedButton(
        onPressed: onClick,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: color,
              width: 2
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
          )
        ),
        child: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: color
          ),
        ),
      ),
    );
  }
}
