import 'package:emotion_tracker/features/history/components/history_row.dart';
import 'package:emotion_tracker/features/history/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
            child: Obx(() {
              final histories = controller.histories;
              return ListView.builder(
                controller: controller.scrollController,
                shrinkWrap: true,
                itemCount: histories.length,
                itemBuilder: (context, index){
                  final history = histories[index];
                  return HistoryRow(
                    history: history,
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
