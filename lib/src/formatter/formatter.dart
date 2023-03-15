/// [DateTime] formatter.
///
/// Custom formatter can be created by extending this class.
/// The [format] method must be implemented.
///
/// Example:
/// ```dart
/// class CustomFormatter implements DateTimeFormatter {
///     const CustomFormatter();
///
///     @override
///     String format(DateTime date) {
///       // Format the date and return the formatted string.
///     }
///
///     @override
///     String get specifier => 'custom';
/// }
/// ```
abstract class DateTimeFormatter {
  /// Format the given [date] and return the formatted string.
  ///
  /// The format specifiers are case-sensitive.
  ///
  /// The following table lists the available format specifiers:
  ///
  /// | Specifier | Meaning | Example |
  /// |-----------|---------|---------|
  /// | `YYYY` | Year with 4 digits | `2019` |
  /// | `YY` | Year with 2 digits | `19` |
  /// | `MMMM` | Month name | `January` |
  /// | ... | ... | ... |
  String format(DateTime date);

  /// Defined the format specifier.
  ///
  /// **Note**: The format specifiers are case-sensitive.
  String get specifier;
}
