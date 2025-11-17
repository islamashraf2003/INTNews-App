List<String> splitText(String text) {
  // Detect if it's structured content
  final hasNumberedPoints = RegExp(r'\d+\.\s').hasMatch(text);
  final hasBoldSections = RegExp(r'\*\*.*?\*\*').hasMatch(text);

  // If it's structured, split by '£' (custom separator)
  if (hasNumberedPoints || hasBoldSections) {
    return text
        .split('£')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  // Else normal split by dot
  return text
      .split(RegExp(r'[.]'))
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
}
