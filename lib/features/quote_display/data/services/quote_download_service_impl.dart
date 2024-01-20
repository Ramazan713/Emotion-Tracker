
import 'package:emotion_tracker/features/quote_display/domain/models/quote_model.dart';
import 'package:emotion_tracker/features/quote_display/domain/services/quote_download_service.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class QuoteDownloadServiceImpl extends QuoteDownloadService{

  @override
  Future<List<QuoteModel>> downloadQuotes(String emotion) async{
    try{
      final uri = Uri.parse("https://favqs.com/search/$emotion");
      final response = await http.get(uri);
      if(response.statusCode != 200) return [];
      return _parseResponse2(response.body);
    }catch(e){
      return [];
    }
  }

  //from mobile response
  Future<List<QuoteModel>> _parseResponse2(String response) async{
    final document = parse(response);
    final quotes = <QuoteModel>[];

    final resultDiv = document.getElementsByClassName("chat-bubbles").firstOrNull;

    if(resultDiv == null) return [];

    for (final quoteDiv in resultDiv.children) {
      final authorDiv = quoteDiv.querySelector("div");
      final author = authorDiv?.text.replaceAll("—", "").trim();

      quoteDiv.children.remove(authorDiv);
      final content = quoteDiv.text.trim();
      if(author == null) continue;

      final quote = QuoteModel(content: content, author: author);
      quotes.add(quote);
    }

    return quotes;
  }

  //from web response
  Future<List<QuoteModel>> _parseResponse(String response) async{
    final document = parse(response);
    final quotes = <QuoteModel>[];

    final resultDiv = document.getElementsByClassName("results").firstOrNull;

    if(resultDiv == null) return [];

    for (final quoteDiv in resultDiv.children) {
      if(quoteDiv.id.contains("quote")){
        final contentDiv = quoteDiv.getElementsByClassName("quote").firstOrNull;

        if(contentDiv == null) continue;

        final content = contentDiv.querySelector("a")?.text.trim();
        final author = contentDiv.querySelector("span")?.text.replaceAll("—", "").trim();
        if(content == null || author == null) continue;

        final quote = QuoteModel(content: content, author: author);
        quotes.add(quote);
      }
    }

    return quotes;
  }



}