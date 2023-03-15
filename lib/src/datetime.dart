/// [DateTime] extension for adding, subtracting.
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
extension DateTimeAddSubtract on DateTime {
  /// Add [Duration] to [DateTime].
  DateTime operator +(Duration duration) => add(duration);

  /// Subtract [Duration] from [DateTime].
  DateTime operator -(Duration duration) => subtract(duration);
}

/// [DateTime] extension for comparing.
///
/// ## Less than
/// ```dart
/// final value = DateTime.now() < DateTime.now();
/// ```
///
/// ## Greater than
/// ```dart
/// final value = DateTime.now() > DateTime.now();
/// ```
///
/// ## Less than or equal
/// ```dart
/// final value = DateTime.now() <= DateTime.now();
/// final value = DateTime.now().isBeforeOrEqual(DateTime.now());
/// ```
///
/// ## Greater than or equal
/// ```dart
/// final value = DateTime.now() >= DateTime.now();
/// final value = DateTime.now().isAfterOrEqual(DateTime.now());
/// ```
///
/// ## Equal
/// ```dart
/// final value = DateTime.now() == DateTime.now();
/// final value = DateTime.now().isEqual(DateTime.now());
/// ```
///
/// ## Not equal
/// ```dart
/// final value = DateTime.now() != DateTime.now();
/// final value = DateTime.now().isNotEqual(DateTime.now());
/// ```
extension DateTimeCompare on DateTime {
  /// Compare [DateTime] with [DateTime] less than or equal.
  bool isBeforeOrEqual(DateTime other) => compareTo(other) <= 0;

  /// Compare [DateTime] with [DateTime] greater than or equal.
  bool isAfterOrEqual(DateTime other) => compareTo(other) >= 0;

  /// Compare [DateTime] with [DateTime] equal.
  bool isEqual(DateTime other) => other == this;

  /// Compare [DateTime] with [DateTime] not equal.
  bool isNotEqual(DateTime other) => !isEqual(other);

  /// Compare [DateTime] with [DateTime] less than.
  bool operator <(DateTime other) => isBefore(other);

  /// Compare [DateTime] with [DateTime] greater than.
  bool operator >(DateTime other) => isAfter(other);

  /// Compare [DateTime] with [DateTime] less than or equal.
  bool operator <=(DateTime other) => isBeforeOrEqual(other);

  /// Compare [DateTime] with [DateTime] greater than or equal.
  bool operator >=(DateTime other) => isAfterOrEqual(other);
}

/// [DateTime] extension for always returning a UTC [DateTime].
extension DateTimeUtc on DateTime {
  /// Always return a UTC [DateTime].
  DateTime get utc => isUtc ? this : toUtc();
}
