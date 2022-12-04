class TaskEntity {
  final String id;
  final String title;
  final String subtitle;
  final bool isDone;
  TaskEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isDone,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskEntity &&
        other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ subtitle.hashCode ^ isDone.hashCode;
  }
}
