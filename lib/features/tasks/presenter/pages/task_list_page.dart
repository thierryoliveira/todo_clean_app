import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/extensions/build_context.dart';
import 'package:todo_clean_solid/core/theme/text_styles.dart';
import 'package:todo_clean_solid/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_clean_solid/features/tasks/presenter/cubits/task/task_cubit.dart';
import 'package:todo_clean_solid/features/tasks/presenter/pages/add_task_field.dart';
import 'package:todo_clean_solid/features/tasks/presenter/widgets/task_item.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  late TaskCubit taskCubit;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    taskCubit = context.read<TaskCubit>();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButton: AddTaskField(
          textController: textController,
          onTapCreate: () => taskCubit.createTask(
              taskEntity: TaskEntity(
                  id: '0', title: 'Teste', subtitle: 'Teste', isDone: true))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .05),
        child: BlocListener<TaskCubit, TaskState>(
          bloc: taskCubit,
          listener: (context, state) {
            if (state is CreateTaskSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Task criada com sucesso')));
              textController.clear();
            }
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: context.height * .06, bottom: context.height * .04),
                child: Text(
                  'What will you like to do?',
                  style: TextStyles.header1,
                ),
              ),
              const TaskItem(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ));
}
