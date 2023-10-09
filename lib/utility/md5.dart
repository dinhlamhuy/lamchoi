import 'dart:convert';

import 'package:crypto/crypto.dart';

String generateMd5(String input) {
  final bytes = utf8.encode(input);
  final md5Hash = md5.convert(bytes);
  return md5Hash.toString();
}
