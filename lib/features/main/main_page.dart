import 'package:emotion_tracker/core/utils/emotions_util.dart';
import 'package:emotion_tracker/features/history/history_page.dart';
import 'package:emotion_tracker/features/main/main_controller.dart';
import 'package:emotion_tracker/features/quote_display/presentation/quote_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/emotion_collection_item.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Main Page",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "How are you ?",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 8,),
              EmotionCollectionItem(
                margins: const EdgeInsets.symmetric(vertical: 16),
                title: "Positive Emotions",
                emotions: EmotionsUtil.positiveEmotions,
                isPositive: true,
                onClick: (emotion){
                  controller.insertHistory(emotion);
                  Get.to(() => const QuoteDetailPage(), arguments: {"emotion": emotion});
                },
              ),
              EmotionCollectionItem(
                margins: const EdgeInsets.symmetric(vertical: 16),
                title: "Negative Emotions",
                emotions: EmotionsUtil.negativeEmotions,
                isPositive: false,
                onClick: (emotion){
                  controller.insertHistory(emotion);
                  Get.to(() => const QuoteDetailPage(),arguments: {"emotion": emotion});
                },
              ),
              FilledButton(
                onPressed: (){
                  Get.to(const HistoryPage());
                },
                child: const Text("Show History")
              )
            ],
          ),
        ),
      ),
    );
  }
}
