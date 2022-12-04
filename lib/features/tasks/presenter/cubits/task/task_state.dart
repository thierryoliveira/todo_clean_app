part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class CreateTaskLoading extends TaskState {}

class CreateTaskSuccess extends TaskState {}

class CreateTaskError extends TaskState {
  final String error;
  const CreateTaskError({
    required this.error,
  });
}
