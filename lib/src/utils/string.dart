Pattern _whitespaceAlphaNumericPattern =
    RegExp(r'(\s)|(\d)|(\w)|(.)', unicode: true, multiLine: true);

String cleanupString(
  String value, {
  bool ignoreCase = false,
  bool ignoreWhitespace = false,
  bool ignoreNumbers = false,
  bool alphaNumericOnly = false,
}) {
  if (ignoreCase) {
    value = value.toLowerCase();
  }
  if (ignoreNumbers || ignoreWhitespace || alphaNumericOnly) {
    value = value.replaceAllMapped(_whitespaceAlphaNumericPattern, (Match m) {
      String? s = m.group(1);
      String? d = m.group(2);
      String? w = m.group(3);
      if (w != null) return w; // match is alpha
      if (d != null) return ignoreNumbers ? '' : d; // match is numeric
      if (alphaNumericOnly) return '';
      if (s != null) return ignoreWhitespace ? '' : s; // match is whitespace
      return m.group(0) ?? '';
    });
  }
  return value;
}
