import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/extensions/build_context.dart';
import 'package:todo_clean_solid/core/theme/colors.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/add_task_field/add_task_field_cubit.dart';

class AddTaskField extends StatefulWidget {
  const AddTaskField({super.key});

  @override
  State<AddTaskField> createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {
  late AddTaskFieldCubit addTaskFieldCubit;
  late FocusNode addTaskFocus;

  @override
  void initState() {
    super.initState();
    addTaskFieldCubit = context.read<AddTaskFieldCubit>();
    addTaskFocus = FocusNode();
  }

  @override
  void dispose() {
    addTaskFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskFieldCubit, bool>(
      bloc: addTaskFieldCubit,
      builder: (context, isAdding) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: isAdding ? context.width * .7 : 0,
              height: isAdding ? 50 : 0,
              child: TextField(
                focusNode: addTaskFocus,
                onEditingComplete: () {
                  addTaskFocus.unfocus();
                  addTaskFieldCubit.changeIsAddingTask();
                },
                decoration: const InputDecoration(
                    filled: true, fillColor: CustomColors.white),
              ),
            ),
            SizedBox(width: context.width * .05),
            FloatingActionButton(
              backgroundColor: CustomColors.blue,
              onPressed: () {
                //TODO: refactor this responsability to have no logic on this callback
                if (isAdding) {
                } else {
                  addTaskFieldCubit.changeIsAddingTask();
                  addTaskFocus.requestFocus();
                }
              },
              child: Icon(isAdding ? Icons.check : Icons.add),
            ),
          ],
        );
      },
    );
  }
}
