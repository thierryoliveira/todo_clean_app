import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel(
      {required super.id,
      required super.title,
      required super.subtitle,
      required super.isDone});

  factory TaskModel.fromEntity(TaskEntity entity) => TaskModel(
      id: entity.id,
      title: entity.title,
      subtitle: entity.subtitle,
      isDone: entity.isDone);

  Map<String, dynamic> toMap() =>
      {'title': title, 'subtitle': subtitle, 'isDone': isDone};
}
