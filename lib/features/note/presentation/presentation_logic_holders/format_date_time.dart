String formatDateTime(DateTime dateTime) {
  final day = dateTime.day;

  final String month = Months.values[dateTime.month - 1].toString().split('.')[1];
  final String fMonth = month[0].toUpperCase() + month.substring(1, month.length);

  final year = dateTime.year;

  final hour = dateTime.hour;

  final minute = dateTime.minute;

  if (year == DateTime.now().year) return '$day $fMonth | $hour:$minute';
  return '$day $fMonth, $year';
}

enum Months {
  jan,
  feb,
  mar,
  apr,
  may,
  jun,
  jul,
  aug,
  sep,
  oct,
  nov,
  dec,
}
