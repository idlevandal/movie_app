import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  // add api key by running 'flutter run --dart-define=movieApiKey=MYKEY
  final movieApiKey = const String.fromEnvironment('movieApiKey');
}

final environmentConfigProvider = Provider<String>((ref) {
  // return EnvironmentConfig();
  return '33fd256b35409bd80ff86645ea2bceb0';
});