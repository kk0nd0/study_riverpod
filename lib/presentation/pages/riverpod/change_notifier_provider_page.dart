import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterChangeNotifierProvider =
    ChangeNotifierProvider((ref) => ChangeNotifierModel());

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterChangeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ChangeNotifierProviderPage')),
      body: Center(
        child: Text('${counter.count}'),
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

class ChangeNotifierModel extends ChangeNotifier {
  /// 状態を定義・保持
  int count = 0;

  /// 'notifyListeners()' で状態(count)の変化を通知
  /// 'count' を使用しているWidgetの再構築が行われる
  void increase() {
    count++;

    notifyListeners();
  }
}
