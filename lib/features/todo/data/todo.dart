import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../configs/date_time_converter.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'created_at')
    @DateTimeConverter()
        required DateTime createdAt,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
