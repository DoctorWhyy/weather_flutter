String offsetDateFormatter(int offset) {
  final currentDate = new DateTime.now();
  final dateWithOffset = currentDate.add(Duration(days: offset));
  final formattedDateOffset =
      "${dateWithOffset.year}/${dateWithOffset.month}/${dateWithOffset.day}";
  return formattedDateOffset;
}
