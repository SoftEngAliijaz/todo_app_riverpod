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

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '', isChanged: false));

  void search(String query) {
    state = state.copywith(search: query);
  }

  void onChanged(bool isChanged) {
    state = state.copywith(isChanged: isChanged);
  }
}

class SearchState {
  final String search;
  final bool isChanged;
  SearchState({
    required this.search,
    required this.isChanged,
  });

  SearchState copywith({
    String? search,
    bool? isChanged,
  }) {
    return SearchState(
      search: search ?? this.search,
      isChanged: isChanged ?? this.isChanged,
    );
  }
}
