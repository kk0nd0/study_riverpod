import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Providerを読み取る。 '.notifier' を付けると 'StateController'
    /// 付けなければ、 'state' つまり int が取得できる
    final counter = ref.read(counterProvider.notifier);
    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('StateProviderPage')),
      body: Center(
        child: Text('$count'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// どちらでもいける
          counter.state++;
          //ref.read(counterProvider.state).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
