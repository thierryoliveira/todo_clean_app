import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({required super.id, required super.title, required super.isDone});

  factory TaskModel.fromEntity(TaskEntity entity) =>
      TaskModel(id: entity.id, title: entity.title, isDone: entity.isDone);

  factory TaskModel.fromMap(Map<String, dynamic> map) => TaskModel(
        id: map['id'],
        title: map['title'],
        isDone: map['isDone'],
      );

  Map<String, dynamic> toMap() => {'id': id, 'title': title, 'isDone': isDone};
}
