import 'package:timeago/timeago.dart';

class MyCustomTime implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '$minutes min';
  @override
  String minutes(int minutes) => '$minutes mins';
  @override
  String aboutAnHour(int minutes) => '${(minutes / 60).floor()} hour';
  @override
  String hours(int hours) => '$hours hours';
  @override
  String aDay(int hours) => '${(hours / 24).floor()} day';
  @override
  String days(int days) => '$days days';
  @override
  String aboutAMonth(int days) => '${(days / 30).floor()} month';
  @override
  String months(int months) => '$months months';
  @override
  String aboutAYear(int year) => '$year year';
  @override
  String years(int years) => '$years years';
  @override
  String wordSeparator() => ' ';
}
