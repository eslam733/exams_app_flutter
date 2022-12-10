import 'dart:math';

String generateRandomString() {
  var r = Random();
  return String.fromCharCodes(List.generate(6, (index) => r.nextInt(33) + 89));
}