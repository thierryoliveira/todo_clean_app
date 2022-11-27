import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskFieldCubit extends Cubit<bool> {
  AddTaskFieldCubit() : super(false);

  void changeIsAddingTask() => emit(!state);
}
