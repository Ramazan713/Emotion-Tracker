
import 'dart:convert';

import '../../domain/services/quote_download_image_service.dart';
import 'package:http/http.dart' as http;


class WikipediaQuoteDownloadImageUrlService extends QuoteDownloadImageUrlService{

  @override
  Future<String?> getImageLink(String author) async {
    try{
      final imageUrl = "https://en.wikipedia.org/w/api.php?action=query&generator=search&gsrlimit=1&prop=pageimages%7Cextracts&pithumbsize=400&gsrsearch=$author&format=json";
      var image = await http.get(Uri.parse(imageUrl));
      var res = json.decode(image.body)["query"]["pages"];
      res = res[res.keys.first];
      return res["thumbnail"]["source"];
    }catch(e){
      return null;
    }
  }

}