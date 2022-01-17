import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('$count'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(counterProvider.state).state++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
