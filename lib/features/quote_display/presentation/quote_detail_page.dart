import 'package:emotion_tracker/features/quote_display/presentation/components/quote_author_text.dart';
import 'package:emotion_tracker/features/quote_display/presentation/components/quote_content_text.dart';
import 'package:emotion_tracker/features/quote_display/presentation/quote_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _grey = Colors.blueGrey[800]!;

class QuoteDetailPage extends GetView<QuoteDetailController> {
  const QuoteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx((){
          if(controller.isLoading.value){
            return const Center(
                child: CircularProgressIndicator(),
            );
          }
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              drawImg(),
              getContent(),
            ],
          );
        }),
      ),
    );
  }

  Widget getContent(){
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 0.6, 1],
            colors: [
              _grey.withAlpha(70),
              _grey.withAlpha(220),
              _grey.withAlpha(255),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Obx((){
          final quote = controller.quote.value;
          return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                QuoteContentText(content: quote?.content),
                QuoteAuthorText(author: quote?.author)
              ]
          );
        })
    );
  }

  Widget drawImg() {
    return Obx((){
      final imgLink = controller.imgLink.value;
      if (imgLink.isEmpty) {
        return Image.asset("assets/images/offline.jpg", fit: BoxFit.cover);
      } else {
        return Image.network(imgLink, fit: BoxFit.cover);
      }
    });
  }

}
