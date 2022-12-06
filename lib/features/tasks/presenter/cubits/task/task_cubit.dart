import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/create_task/create_task_usecase.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/delete_task/delete_task_usecase.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/generate_random_id/generate_random_id_usecase.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/get_all_tasks/get_all_tasks_usecase.dart';

import '../../../domain/entities/entities.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final CreateTaskUsecase _createTaskUsecase;
  final GetAllTasksUsecase _getAllTasksUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final GenerateRandomIdUsecase _generateRandomIdUsecase;

  TaskCubit({
    required CreateTaskUsecase createTaskUsecase,
    required GetAllTasksUsecase getAllTasksUsecase,
    required GenerateRandomIdUsecase generateRandomIdUsecase,
    required DeleteTaskUsecase deleteTaskUsecase,
  })  : _createTaskUsecase = createTaskUsecase,
        _getAllTasksUsecase = getAllTasksUsecase,
        _generateRandomIdUsecase = generateRandomIdUsecase,
        _deleteTaskUsecase = deleteTaskUsecase,
        super(TaskInitial());

  Future<void> createTask(
      {required String title, required String subtitle}) async {
    emit(CreateTaskLoading());

    final id = _generateRandomIdUsecase();
    final taskEntity = TaskEntity(
      id: id,
      title: title,
      subtitle: subtitle,
      isDone: false,
    );

    final either = await _createTaskUsecase(taskEntity: taskEntity);

    either.fold(
      (failure) => emit(CreateTaskError(error: failure.message)),
      (_) => emit(CreateTaskSuccess()),
    );
  }

  Future<void> getAllTasks() async {
    emit(GetAllTasksLoading());

    final either = await _getAllTasksUsecase();

    either.fold(
      (failure) => emit(GetAllTasksError(error: failure.message)),
      (tasks) {
        emit(GetAllTasksSuccess(tasks: tasks));
      },
    );
  }

  Future<void> deleteTask({required String taskId}) async {
    emit(DeleteTaskLoading());

    final either = await _deleteTaskUsecase(taskId: taskId);

    either.fold(
      (failure) => emit(DeleteTaskError(error: failure.message)),
      (tasks) {
        emit(DeleteTaskSuccess());
      },
    );
  }
}
