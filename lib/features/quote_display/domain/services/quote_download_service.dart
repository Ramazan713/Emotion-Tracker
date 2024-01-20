
import '../models/quote_model.dart';

abstract class QuoteDownloadService{

  Future<List<QuoteModel>> downloadQuotes(String emotion);
}