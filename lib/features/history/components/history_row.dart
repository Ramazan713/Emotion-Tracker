import 'package:emotion_tracker/core/domain/models/history/history.dart';
import 'package:emotion_tracker/features/history/components/text_value_key.dart';
import 'package:flutter/material.dart';

class HistoryRow extends StatelessWidget {
  final History history;
  final EdgeInsets? margins;

  const HistoryRow({
    super.key,
    required this.history,
    this.margins
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margins ?? EdgeInsets.zero,
      child: Card(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextValueKey(
                  keyText: "Emotion: ",
                  valueText: history.emotion,
                  textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 4,),
              TextValueKey(
                keyText: "Date: ",
                valueText: history.formattedDate,
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
