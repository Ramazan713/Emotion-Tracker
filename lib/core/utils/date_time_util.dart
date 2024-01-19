
import 'package:intl/intl.dart';

class DateTimeUtil{

  static String getFormattedDate(DateTime dateTime){
    return DateFormat('dd/MM/yyyy, HH:mm:ss').format(dateTime);
  }

}