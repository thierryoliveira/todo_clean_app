import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/extensions/build_context.dart';
import 'package:todo_clean_solid/core/theme/colors.dart';
import 'package:todo_clean_solid/features/tasks/domain/entities/enums/create_task_button_type.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/add_task_field/add_task_field_cubit.dart';
import 'package:todo_clean_solid/features/tasks/presenter/widgets/task/add_task_button.dart';

class AddTaskField extends StatefulWidget {
  final VoidCallback onTapCreate;
  final TextEditingController textController;

  const AddTaskField({
    super.key,
    required this.onTapCreate,
    required this.textController,
  });

  @override
  State<AddTaskField> createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {
  late AddTaskFieldCubit addTaskFieldCubit;
  late FocusNode addTaskFocus;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    addTaskFieldCubit = context.read<AddTaskFieldCubit>();
    addTaskFocus = FocusNode();
    formKey = GlobalKey<FormState>();
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
              child: Form(
                key: formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please, add some text';
                    }
                    return null;
                  },
                  controller: widget.textController,
                  focusNode: addTaskFocus,
                  onEditingComplete: () {
                    addTaskFocus.unfocus();
                    addTaskFieldCubit.changeIsAddingTask();
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: CustomColors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: context.width * .05),
            AddTaskButton(
              createTaskButtonType: isAdding
                  ? CreateTaskButtonType.done
                  : CreateTaskButtonType.add,
              onTap: isAdding
                  ? () {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      widget.onTapCreate();
                      addTaskFocus.unfocus();
                      addTaskFieldCubit.changeIsAddingTask();
                    }
                  : () {
                      addTaskFieldCubit.changeIsAddingTask();
                      addTaskFocus.requestFocus();
                    },
            ),
          ],
        );
      },
    );
  }
}
