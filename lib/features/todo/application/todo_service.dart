import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/features/todo/data/todo.dart';

final todoProvider =
    StateNotifierProvider<TodoService, List<Todo>>((ref) => TodoService());

class TodoService extends StateNotifier<List<Todo>> {
  TodoService() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(Todo removeTodo) {
    state = state.where((todo) => todo != removeTodo).toList();
  }

  void allRemoveTodo() {
    state = [];
  }
}
