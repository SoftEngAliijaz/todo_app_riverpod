import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/constants/app_providers.dart';

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
