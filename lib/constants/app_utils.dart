import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppUtils {}

final showMessageProvider = Provider<String>((ref) {
  return 'Welcome to your ToDo App';
});

final showUserNameProvider = Provider<String>((ref) => 'Alice');

final showValueProvider = Provider<int>((ref) => 42);

final sliderProvider = StateProvider<double>((ref) {
  return 0.0;
});

final counterProvider = StateProvider<int>((ref) => 0);

final switchProvider = StateProvider<bool>((ref) {
  return false;
});
