import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_riverpod/presentation/pages/riverpod/change_notifier_provider_page.dart';
import 'package:study_riverpod/presentation/pages/riverpod/listen_provider_page.dart';
import 'package:study_riverpod/presentation/pages/riverpod/state_notifier_provider_page.dart';
import 'package:study_riverpod/presentation/pages/riverpod/state_provider_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StateProviderPage()),
                ),
                child: const Text('StateProviderPage'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StateNotifierProviderPage()),
                ),
                child: const Text('StateNotifierProviderPage'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeNotifierProviderPage()),
                ),
                child: const Text('ChangeNotifierProviderPage'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListenProviderPage()),
                ),
                child: const Text('ListenProviderPage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
