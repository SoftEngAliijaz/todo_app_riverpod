import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_riverpod/constants/app_utils.dart';

class SliderProviderScreen extends ConsumerWidget {
  const SliderProviderScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Provider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.0,
        children: [
          Text(
            'Color Changing Slider Example using Riverpod',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderProvider);

              return SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 500.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue.withOpacity(slider)),
                  ),
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final slider = ref.watch(sliderProvider);

              return Slider(
                value: slider,
                onChanged: (value) {
                  ref.read(sliderProvider.notifier).state = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
