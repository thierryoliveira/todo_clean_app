import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean_solid/core/extensions/build_context.dart';
import 'package:todo_clean_solid/core/theme/colors.dart';
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
    taskCubit = context.read<TaskCubit>()..getAllTasks();
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
                title: textController.text,
              )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * .05),
        child: RefreshIndicator(
          onRefresh: taskCubit.getAllTasks,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * .1,
              ),
              const Text(
                '✨ Task list ✨',
                style: TextStyle(
                    color: CustomColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              BlocConsumer<TaskCubit, TaskState>(
                  bloc: taskCubit,
                  listener: (context, state) async {
                    if (state is CreateTaskSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Task criada com sucesso')));
                      await taskCubit.getAllTasks();

                      textController.clear();
                    } else if (state is DeleteTaskSuccess ||
                        state is ChangeIsDoneTaskSuccess) {
                      await taskCubit.getAllTasks();
                    }
                  },
                  builder: (context, state) {
                    if (state is GetAllTasksSuccess) {
                      if (state.tasks.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(top: context.height * .1),
                          child: const Center(
                            child: Text(
                              'Nothing to do,\n let\'s to add a new task?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.tasks.length,
                          itemBuilder: (context, index) {
                            final currentTask = state.tasks[index];
                            return Padding(
                              padding:
                                  EdgeInsets.only(bottom: context.height * .02),
                              child: TaskItem(
                                title: currentTask.title,
                                isDone: currentTask.isDone,
                                onDelete: () async => await taskCubit
                                    .deleteTask(taskId: currentTask.id),
                                onChangeIsDone: () async =>
                                    await taskCubit.changeIsDone(
                                  taskEntity: currentTask,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is GetAllTasksError) {
                      return Padding(
                        padding: EdgeInsets.only(top: context.height * .3),
                        child: Center(
                          child: Text(
                            state.error,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ],
          ),
        ),
      ));
}
