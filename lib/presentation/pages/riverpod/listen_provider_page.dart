import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterNotifierProvider = StateNotifierProvider<StateNotifierModel, int>(
  (ref) => StateNotifierModel(),
);

class ListenProviderPage extends ConsumerWidget {
  const ListenProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider.notifier);
    final count = ref.watch(counterNotifierProvider);

    ref.listen<int>(
      counterNotifierProvider,
      (previous, next) {
        if (next.isEven) {
          return; // 偶数なら何もしない。
        }
        showDialog<void>(
          context: context,
          builder: (context) {
            return const AlertDialog(
              // ダイアログを表示
              title: Text('Current number is Odd !'),
            );
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(title: const Text('ListenProviderPage')),
      body: Center(
        child: Text('$count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increase();
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
