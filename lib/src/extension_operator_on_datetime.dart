/// [DateTime] operator extension.
///
/// ## Add
/// ```dart
/// final value = DateTime.now() + Duration(days: 1);
/// ```
///
/// ## Subtract
/// ```dart
/// final value = DateTime.now() - Duration(days: 1);
/// ```
extension DateTimeOperatorExtension on DateTime {
  /// Add [Duration] to [DateTime].
  DateTime operator +(Duration duration) => add(duration);

  /// Subtract [Duration] from [DateTime].
  DateTime operator -(Duration duration) => subtract(duration);
}
