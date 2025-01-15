import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showMessageProvider = Provider<String>((ref) {
  return 'Welcome to your ToDo App';
});

final showUserNameProvider = Provider<String>((ref) => 'Alice');

final showValueProvider = Provider<int>((ref) => 42);

class SimpleProviderScreen extends ConsumerStatefulWidget {
  const SimpleProviderScreen({super.key});

  @override
  ConsumerState<SimpleProviderScreen> createState() =>
      _SimpleProviderScreenState();
}

class _SimpleProviderScreenState extends ConsumerState<SimpleProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final username = ref.watch(showUserNameProvider);
    final value = ref.watch(showValueProvider);
    final message = ref.watch(showMessageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$message $value'),
          ],
        ),
      ),
    );
  }
}
