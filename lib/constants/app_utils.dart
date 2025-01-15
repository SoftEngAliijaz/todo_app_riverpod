class AppUtils {}

class AppState {
  final double slider;
  final bool showPassword;

  AppState({
    required this.slider,
    required this.showPassword,
  });

  AppState copywith({
    double? slider,
    bool? showPassword,
  }) {
    return AppState(
      slider: slider ?? this.slider,
      showPassword: showPassword ?? this.showPassword,
    );
  }
}
