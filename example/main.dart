import 'package:now/now.dart';

void main(List<String> args) {
  final pattern = 'YYYY-MM-DD HH:mm:ss.SSS';
  final formated = now().format(pattern);

  print(formated);

  final current = DateTime.now();
  final formated2 = current.format(pattern);

  print(formated2);
}
