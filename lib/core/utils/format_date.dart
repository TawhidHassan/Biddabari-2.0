import 'package:intl/intl.dart';

String formatDateBydMMMYYYY(DateTime dateTime) {
  return DateFormat("d MMM yyyy").format(dateTime);
}


getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
  // dateFormat = 'MM/dd/yy';
  var date = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(givenDateTime, true);
  var local = date.toLocal().toString();
  // print(local);
  final DateTime docDateTime = DateTime.parse(local);
  return DateFormat(dateFormat).format(docDateTime);
  // return docDateTime;
}