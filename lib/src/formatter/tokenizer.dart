import '../now.dart';
import 'token.dart';

/// [DateTime] pattern tokenizer.
///
/// This class is used to tokenize a [DateTime] pattern.
///
/// Example:
/// ```dart
/// import 'package:now/formatter.dart';
///
/// void main() {
///  final pattern = 'YYYY-MM-DD HH:mm:ss';
///  final tokens = DateTimePatternTokenizer.parse(pattern);
///
///  print(tokens);
/// }
/// ```
abstract class DateTimePatternTokenizer {
  /// Inernal tokenizer.
  static const DateTimePatternTokenizer _tokenizer = _TokenizerImpl();

  /// Parse the given [pattern] and return a iterable of [DateTimePatternToken].
  static Iterable<DateTimePatternToken> parse(String pattern) =>
      _tokenizer.tokenize(pattern);

  /// Tokenize the given [pattern] and return a iterable of [DateTimePatternToken].
  Iterable<DateTimePatternToken> tokenize(String pattern);
}

/// Iterable extension on [DateTimePatternToken] list.
extension DateTimePatternTokensFormat on Iterable<DateTimePatternToken> {
  /// Format the given [date] and return the formatted string.
  String format(DateTime date) => map((token) => token.format(date)).join();
}

/// Internal tokenizer implementation.
class _TokenizerImpl implements DateTimePatternTokenizer {
  const _TokenizerImpl();

  @override
  Iterable<DateTimePatternToken> tokenize(String pattern) {
    // Resolve formatters, specifier sorted from most to least.
    final formatters = now.formatters.toList()
      ..sort((a, b) => b.specifier.length.compareTo(a.specifier.length));

    // Tokenize pattern.
    final List<DateTimePatternToken> tokens = pattern.runes
        .map((charCode) =>
            DateTimePatternToken.string(String.fromCharCode(charCode)))
        .toList();

    // If the previous token is `\`, remove it previous token.
    final size = tokens.length;
    int offset = 0;
    for (int index = 1; index < size; index++) {
      final currentIndex = index - offset;
      final current = tokens[currentIndex];

      final previousIndex = currentIndex - 1;
      final previous = tokens[currentIndex - 1];

      if (previous.value == r'\') {
        // Remove current token. reset previous token is current token.
        tokens[previousIndex] = current;
        tokens.removeAt(currentIndex);

        // replace pattern.
        pattern = pattern.replaceRange(
          previousIndex,
          currentIndex + 1,
          now.forbiddenSpecifier,
        );

        // Increase offset.
        offset++;
      }
    }

    bool running = formatters.isNotEmpty;
    while (running) {
      for (final formatter in formatters) {
        final specifier = formatter.specifier;
        final index = pattern.indexOf(specifier);
        if (index != -1) {
          final size = specifier.length;

          // The index token replaces the formatter token.
          tokens[index] = DateTimePatternToken.formatter(formatter);

          // Generate end index.
          final max = size + index;
          final int end = max > tokens.length ? tokens.length : max;

          /// Replace tokens.
          tokens.replaceRange(
            index + 1,
            end,
            Iterable.generate(
                size - 1, (_) => const DateTimePatternToken.remove()),
          );

          // Replace pattern.
          pattern =
              pattern.replaceRange(index, end, now.forbiddenSpecifier * size);

          break;
        }

        // Check if we are at the end of the formatters.
        final formatterIndex = formatters.indexOf(formatter);
        if (formatterIndex == formatters.length - 1) {
          running = false;
          break;
        }
      }
    }

    return tokens;
  }
}
