import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/features/tasks/domain/usecases/create_task/create_task_usecase.dart';

import '../../../domain/entities/entities.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final CreateTaskUsecase _createTaskUsecase;

  TaskCubit({required CreateTaskUsecase createTaskUsecase})
      : _createTaskUsecase = createTaskUsecase,
        super(TaskInitial());

  Future<void> createTask({required TaskEntity taskEntity}) async {
    emit(CreateTaskLoading());

    final either = await _createTaskUsecase(taskEntity: taskEntity);

    either.fold(
      (failure) => emit(CreateTaskError(error: failure.message)),
      (_) => emit(CreateTaskSuccess()),
    );
  }
}
