import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/features/todo/application/todo_service.dart';
import 'package:todo_riverpod/features/todo/data/todo.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchで、初期値が空のリストを呼び出して、監視する。
    final todoList = ref.watch(todoProvider);

    final bodyController = TextEditingController();

    // ランダムな数値を作り出す変数
    final randomId = Random().nextInt(100) + 50;

    final createdAt = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(todoProvider.notifier).allRemoveTodo();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: bodyController,
                  decoration: InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // NoteModelクラスに、ダミーのデータを引数として渡して保存する.
                  ref.read(todoProvider.notifier).addTodo(
                        Todo(
                          id: randomId.toString(),
                          content: bodyController.text,
                          createdAt: createdAt,
                        ),
                      );
                },
                child: const Text('Add note'),
              ),
              const SizedBox(height: 20),
              todoList.isEmpty
                  ? const Text('Add notes ')
                  : ListView.builder(
                      itemCount:
                          todoList.length, // StateNotifierのリストに追加されたデータの数を数える.
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final todo = todoList[index];
                        return ListTile(
                          title: Text(
                            'id: ${todo.id} memo: ${todo.content}',
                          ), // idとフォームから入力された値を表示.
                          subtitle: Text(
                            todo.createdAt.toIso8601String(),
                          ), // リストにデータを追加した時刻を表示.
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // リストのidを取得してボタンを押したリストだけ削除する.
                              ref
                                  .read(todoProvider.notifier)
                                  .removeTodo(todoList[index]);
                            },
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
