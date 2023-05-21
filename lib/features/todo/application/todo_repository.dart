import 'package:todo_riverpod/features/todo/data/todo.dart';

abstract class TodoRepository {
  List<Todo> fetchTodoList();
  void saveTodoList({required List<Todo> todoList});
  void allRemoveTodo();
}
