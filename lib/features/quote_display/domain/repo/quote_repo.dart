
import 'package:emotion_tracker/features/quote_display/domain/models/quote_model.dart';

abstract class QuoteRepo{

  Future<QuoteModel> getRandomQuote(String emotion);
}