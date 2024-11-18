String DayLeftcalculate(String? time){
  String targetDateTimeString = time!; // Input date as a string
  DateTime targetDateTime = DateTime.parse(targetDateTimeString.replaceAll(' ', 'T')); // Convert to DateTime
  DateTime currentDateTime = DateTime.now(); // Current date and time

  Duration difference = targetDateTime.difference(currentDateTime);

  int daysLeft = difference.inDays;
  int hoursLeft = difference.inHours % 24;
  int minutesLeft = difference.inMinutes % 60;

  print('Time left: $daysLeft days, $hoursLeft hours, $minutesLeft minutes');

  return "${'$daysLeft days, $hoursLeft hours, $minutesLeft minutes'}";
}