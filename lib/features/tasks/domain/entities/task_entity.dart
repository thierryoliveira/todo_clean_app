class TaskEntity {
  final String id;
  final String title;
  final bool isDone;
  TaskEntity({
    required this.id,
    required this.title,
    required this.isDone,
  });

  factory TaskEntity.changeIsDoneValue({required TaskEntity entity}) =>
      TaskEntity(id: entity.id, title: entity.title, isDone: !entity.isDone);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskEntity &&
        other.id == id &&
        other.title == title &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ isDone.hashCode;
  }
}
