import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/features/todo/application/todo_repository_impl.dart';
import 'package:todo_riverpod/features/todo/data/todo.dart';

final todoProvider = StateNotifierProvider<TodoService, List<Todo>>((ref) {
  final todoList = ref.read(todoRepositoryImplProvider).fetchTodoList();
  return TodoService(ref, todoList);
});

class TodoService extends StateNotifier<List<Todo>> {
  TodoService(
    this.ref,
    List<Todo>? initialTodos,
  ) : super(initialTodos ?? []);

  final Ref ref;

  List<Todo> fetchTodoList() {
    return ref.read(todoRepositoryImplProvider).fetchTodoList();
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
    ref.read(todoRepositoryImplProvider).saveTodoList(todoList: state);
  }

  void removeTodo(Todo removeTodo) {
    state = state.where((todo) => todo != removeTodo).toList();
    ref.read(todoRepositoryImplProvider).saveTodoList(todoList: state);
  }

  void allRemoveTodo() {
    state = [];
    ref.read(todoRepositoryImplProvider).allRemoveTodo();
  }
}
