import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_riverpod/app.dart';
import 'package:todo_riverpod/features/todo/application/todo_repository_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 画面の向きを固定する。
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
