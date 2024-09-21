import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/configs/theme_selector_provider.dart';
import 'package:todo_riverpod/features/todo/presentation/todo_list_page.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.amber,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.orange,
      ),
      themeMode: ref.watch(themeSelectorProvider),
      home: const TodoListPage(),
    );
  }
}
