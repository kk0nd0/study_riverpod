import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:study_riverpod/presentation/pages/home_page.dart';
import 'package:study_riverpod/presentation/res/theme.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'study_riverpod',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
