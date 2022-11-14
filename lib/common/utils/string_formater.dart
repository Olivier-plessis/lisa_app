extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((String str) => str.toCapitalized())
      .join(' ');
}

String getNewLineString(List<String> readLines) {
  StringBuffer sb = StringBuffer();
  for (final String line in readLines) {
    sb.write('$line\n\n');
  }
  return sb.toString();
}

String getFirstWords(String sentence, int wordCounts) {
  return sentence.split(' ').sublist(0, wordCounts).join(' ');
}
