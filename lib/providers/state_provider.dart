import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/constants/app_utils.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('State Provider Example')),
      body: Column(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (c, i, s) {
              final counter = ref.watch(counterProvider);
              return Text(
                '$counter',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.0,
            children: [
              CircleAvatar(
                child: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    print('minus & build');
                    ref.read(counterProvider.notifier).state--;
                  },
                ),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    print('plus & build');
                    ref.read(counterProvider.notifier).state++;
                  },
                ),
              ),
            ],
          ),
          Consumer(
            builder: (
              BuildContext context,
              WidgetRef ref,
              Widget? child,
            ) {
              final switchValue = ref.watch(switchProvider);
              return CircleAvatar(
                child: Switch(
                  value: switchValue,
                  onChanged: (bool value) {
                    print('switch on & build');
                    ref.read(switchProvider.notifier).state = value;
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
