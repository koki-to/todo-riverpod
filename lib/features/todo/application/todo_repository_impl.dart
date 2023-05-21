import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_riverpod/features/todo/application/todo_repository.dart';
import 'package:todo_riverpod/features/todo/data/todo.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final todoRepositoryImplProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(
    ref.watch(sharedPreferencesProvider),
  ),
);

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl(this.prefs);

  final SharedPreferences prefs;

  @override
  void saveTodoList({required List<Todo> todoList}) {
    prefs.remove('todoList');
    final todoJsonList = todoList.map((todo) => todo.toJson()).toList();
    final encodeData = todoJsonList.map(jsonEncode).toList();
    prefs.setStringList('todoList', encodeData);
  }

  @override
  void allRemoveTodo() {
    prefs.remove('todoList');
  }

  @override
  List<Todo> fetchTodoList() {
    final todoJsonList = prefs.getStringList('todoList') ?? [];
    return todoJsonList.map((json) {
      final jsonMap = jsonDecode(json) as Map<String, dynamic>;
      return Todo.fromJson(jsonMap);
    }).toList();
  }
}
