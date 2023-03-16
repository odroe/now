# Now

A minimalist DateTime library for validating, parsing, manipulating and formatting times.

## Installation

This will add a like this to you packages `pubspec.yaml` file:

```yaml
dependencies:
  now: latest
```

Or you can install it from the command line:

```bash
dart pub add now
```

## Sponsors

Now is an [MIT licensed](LICENSE) open source project with its ongoing development made possible entirely by the support of these awesome backers. If you'd like to join them, please consider [sponsoring Odroe development](https://github.com/sponsors/odroe).

<p align="center">
  <a target="_blank" href="https://github.com/sponsors/odroe#sponsors">
    <img alt="sponsors" src="https://github.com/odroe/.github/raw/main/sponsors.svg">
  </a>
</p>

## Getting Started

### Create a DateTime

```dart
/// Create a new DateTime from local time zone.
final current = now(); // Same as DateTime.now()
final utc = now.utc(); // Same as DateTime.now().toUtc()
```

### Format a DateTime

```dart
final pattern = 'YYYY-MM-DD HH:mm:ss.SSS';
final formated = now().format(pattern); // Same as DateTime.now().format(pattern)

print(formated); // 2021-08-01 12:00:00.000
```

### Convert a DateTime

Obtained a UTC safely originally from a different time zone.

```dart
final utc = date.isUtc ? date : date.toUtc();
```

Now you can convert it to a UTC time zone.

```dart
final utc = date.utc; // Same as date.isUtc ? date : date.toUtc();
```

### DateTime addition and subtraction

```dart
final date = now();

/// Add 1 day.
final tomorrow = date + 1.day; // Same as date.add(Duration(days: 1));

/// Subtract 1 day.
final yesterday = date - 1.day; // Same as date.subtract(Duration(days: 1));
```

### DateTime comparison

- Compare DateTime with DateTime less than or equal.

  ```dart
  final date1 = now();
  final date2 = date1 + 1.day;

  print(date1 <= date2); // true
  print(date1.isBeforeOrEqual(date2)); // true
  ```

- Compare DateTime with DateTime greater than or equal.

  ```dart
  final date1 = now();
  final date2 = date1 + 1.day;

  print(date2 >= date1); // true
  print(date2.isAfterOrEqual(date1)); // true
  ```

- Compare DateTime with DateTime less than.

  ```dart
  final date1 = now();
  final date2 = date1 + 1.day;

  print(date1 < date2); // true
  print(date1.isBefore(date2)); // true
  ```

- Compare DateTime with DateTime greater than.

  ```dart
  final date1 = now();
  final date2 = date1 + 1.day;

  print(date2 > date1); // true
  print(date2.isAfter(date1)); // true
  ```

### Duration extensions

#### Weeks in the duration

```dart
final Duration duration = Duration(days: 7);

print(duration.inWeeks); // 1
```

#### Convert a int to a Duration

| Unit           | Same as                         | Description                  | Example         |
| -------------- | ------------------------------- | ---------------------------- | --------------- |
| `microseconds` | `Duration(microseconds: <int>)` | Microseconds in the duration | `1.microsecond` |
| `milliseconds` | `Duration(milliseconds: <int>)` | Milliseconds in the duration | `1.millisecond` |
| `seconds`      | `Duration(seconds: <int>)`      | Seconds in the duration      | `1.second`      |
| `minutes`      | `Duration(minutes: <int>)`      | Minutes in the duration      | `1.minute`      |
| `hours`        | `Duration(hours: <int>)`        | Hours in the duration        | `1.hour`        |
| `days`         | `Duration(days: <int>)`         | Days in the duration         | `1.day`         |
| `weeks`        | `Duration(days: <int> * 7)`     | Weeks in the duration        | `1.week`        |

## Format specifiers

By default we register all the built-in formatters.

| specifier | Description            | Example                           |
| --------- | ---------------------- | --------------------------------- |
| `A`       | AM/PM Upper case       | `now().format('A') -> AM`         |
| `a`       | am/pm Lower case       | `now().format('a') -> am`         |
| `D`       | Day of month, 1-31     | `now().format('D') -> 1`          |
| `DD`      | Day of month, 01-31    | `now().format('DD') -> 01`        |
| `d`       | Day of week, 1-7       | `now().format('d') -> 1`          |
| `dd`      | Day of week min name   | `now().format('dd') -> Mo`        |
| `ddd`     | Day of week short name | `now().format('ddd') -> Mon`      |
| `dddd`    | Day of week full name  | `now().format('dddd') -> Monday`  |
| `H`       | Hour, 0-23             | `now().format('H') -> 0`          |
| `HH`      | Hour, 00-23            | `now().format('HH') -> 00`        |
| `h`       | Hour, 1-12             | `now().format('h') -> 1`          |
| `hh`      | Hour, 01-12            | `now().format('hh') -> 01`        |
| `SSS`     | Milliseconds, 000-999  | `now().format('SSS') -> 000`      |
| `m`       | Minute, 0-59           | `now().format('m') -> 0`          |
| `mm`      | Minute, 00-59          | `now().format('mm') -> 00`        |
| `M`       | Month, 1-12            | `now().format('M') -> 1`          |
| `MM`      | Month, 01-12           | `now().format('MM') -> 01`        |
| `MMM`     | Month abbreviated name | `now().format('MMM') -> Jan`      |
| `MMMM`    | Month full name        | `now().format('MMMM') -> January` |
| `Q`       | Quarter, 1-4           | `now().format('Q') -> 1`          |
| `s`       | Second, 0-59           | `now().format('s') -> 0`          |
| `ss`      | Second, 00-59          | `now().format('ss') -> 00`        |
| `YY`      | Year, 00-99            | `now().format('YY') -> 21`        |
| `YYYY`    | Year, 0000-9999        | `now().format('YYYY') -> 2023`    |
| `Z`       | Timezone               | `now().format('Z') -> +01:00`     |
| `ZZ`      | Timezone               | `now().format('ZZ') -> +0100`     |

### Escape specifiers

Occasionally, single-character specifiers exist for formatters. Our formatting mode hopes that this string will not be processed by the formatter, but will output the characters we defined as it is.

- `\` Prefix, a character after the `\` symbol ensures output as is.

  ```dart
  now().format('HH:mm A ss'); // 00:00 AM 00

  // This is not what we expect, since the second s needs to be output as-is.
  now().format(r'HH:mm A s\s'); // 00:00 AM 0s

  // Or
  now().format('HH:mm A s\\s'); // 00:00 AM 0s
  ```

## DateTime formatter

Sometimes the built-in formatter cannot meet all your needs, you can register a DateTime formatter via `now.register`:

```dart
final DateTimeFormatter formatter = ...

now.register(formatter);
```

You may already have a DateTime formatter, but its specifier is not what you expect:

```dart
final DateTimeFormatter formatter = ...

now.registerWith('Custom specifier', formatter);
```

### Custom formatter

If you wish to customize the DateTime formatter, you need to implement the `DateTimeFormatter` interface imported from `package:now/formatter.dart`:

```dart
import 'package:now/formatter.dart';

class MyFormatter implements DateTimeFormatter {
  const MyFormatter();

  /// Matched the [specifier] and return the [DateTime] format result.
  @override
  String format(DateTime dateTime) {
    // TODO: format the [dateTime] and return the result.
    return 'My format result';
  }

  @override
  String get specifier => 'My specifier';
}
```

Then we register and use it:

```dart
import 'package:now/now.dart';

main() {
  now.register(const MyFormatter());

  print(now().format('YYYY - My specifier')); // Output: 2023 - My format result
}
```

## Function-based formatter

If you don't want to implement the `DateTimeFormatter` interface, you can also use the function-based formatter:

```dart
import 'package:now/now.dart';

main() {
  now.registerWithFn('My specifier', (dateTime) {
    return 'My format result';
  });

  print(now().format('YYYY - My specifier')); // Output: 2023 - My format result
}
```

## Stopwatch

We provide a helper method for `Stopwatch` that can be directly created and started:

```dart
final stopwatch = now.stopwatch(); // Same as Stopwatch()..start()
```

## Destroy formatters

| Method                 | Description                                 | Example                                  |
| ---------------------- | ------------------------------------------- | ---------------------------------------- |
| `now.destroy()`        | Destroys a registered with a test function. | `now.destroy((f) => f.specifier == 'A')` |
| `now.destroyAll()`     | Destroys all registered formatters.         | `now.destroyAll()`                       |
| `now.destroyWith()`    | Destroys a registered formatter.            | `now.destroyWith('A')`                   |
| `now.destroyDefault()` | Destroys all built-in formatters.           | `now.destroyDefault()`                   |

## Contributing

We welcome contributions! Please read our [contributing guide](CONTRIBUTING.md) to learn about our development process, how to propose bugfixes and improvements, and how to build and test your changes to Prisma.

Thank you to all the people who already contributed to Odroe!

[![Contributors](https://opencollective.com/openodroe/contributors.svg?width=890)](https://github.com/odroe/prisma-dart/graphs/contributors)

## Code of Conduct

This project has adopted the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). For more information see the [Code of Conduct FAQ](https://www.contributor-covenant.org/faq) or contact [hello@odroe.com](mailto:hello@odroe.com) with any additional questions or comments.

## Stay in touch

- [Website](https://prisma.pub)
- [Twitter](https://twitter.com/odroeinc)
- [Discord](https://discord.gg/r27AjtUUbV)
