import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/constants/app_providers.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: Text('State Notifier Provider Example'),
          centerTitle: true,
        ),
        body: Column(
          spacing: 10.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  hintText: 'Type something...',
                ),
                onChanged: (value) {
                  ref.read(searchProvider.notifier).search(value);
                },
              ),
            ),
            Consumer(builder: (ctx, ref, ch) {
              final search = ref.watch(searchProvider);
              return Text(
                "You're typing: ${search.search}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              );
            }),
            Consumer(builder: (ctx, ref, ch) {
              final isChanged = ref.watch(searchProvider.select((v) {
                return v.isChanged;
              }));

              return Switch(
                  value: isChanged,
                  onChanged: (value) {
                    ref.read(searchProvider.notifier).onChanged(value);
                  });
            })
          ],
        ));
  }
}
