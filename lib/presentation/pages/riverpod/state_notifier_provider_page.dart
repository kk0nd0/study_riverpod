import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterNotifierProvider = StateNotifierProvider<StateNotifierModel, int>(
  (ref) => StateNotifierModel(),
);

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.read(counterNotifierProvider.notifier);
    final count = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('StateNotifierProviderPage')),
      body: Center(
        child: Text('$count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// どちらでもいける
          counter.increase();
          //ref.read(counterNotifierProvider.notifier).increase();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StateNotifierModel extends StateNotifier<int> {
  /// 'super(0)' は初期値
  StateNotifierModel() : super(0);

  void increase() {
    state++;
  }
}
