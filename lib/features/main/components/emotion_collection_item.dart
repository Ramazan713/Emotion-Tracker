import 'package:flutter/material.dart';

import 'emotion_item.dart';

class EmotionCollectionItem extends StatelessWidget {
  final String title;
  final List<String> emotions;
  final bool isPositive;
  final void Function(String emotion) onClick;
  final EdgeInsets? margins;

  const EmotionCollectionItem({
    super.key,
    required this.title,
    required this.onClick,
    required this.isPositive,
    required this.emotions,
    this.margins
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margins ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Wrap(
            children: emotions.map((item){
              return EmotionItem(
                  margins: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                  name: item,
                  isPositive: isPositive,
                  onClick: (){
                    onClick(item);
                  }
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
