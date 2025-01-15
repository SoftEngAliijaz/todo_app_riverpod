import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/constants/app_utils.dart';

final showMessageProvider = Provider<String>((ref) {
  return 'Welcome to your ToDo App';
});

final showUserNameProvider = Provider<String>((ref) => 'Alice');

final showValueProvider = Provider<int>((ref) => 42);

final counterProvider = StateProvider<int>((ref) => 0);

final switchProvider = StateProvider<bool>((ref) {
  return false;
});

final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(
    slider: .4,
    showPassword: false,
  );
});
