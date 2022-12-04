import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_clean_solid/core/constants/database_collections.dart';
import 'package:todo_clean_solid/features/tasks/core/errors/exceptions/task_exception.dart';
import 'package:todo_clean_solid/features/tasks/data/models/task_model.dart';

import '../datasources.dart';

class TaskDatasourceImpl implements TaskDatasource {
  final FirebaseFirestore _database;

  TaskDatasourceImpl({required FirebaseFirestore database})
      : _database = database;

  @override
  Future<bool> createTask({required TaskModel taskModel}) async {
    try {
      final result = await _database
          .collection(DatabaseCollections.tasks)
          .add(taskModel.toMap());
      return true;
    } on FirebaseException catch (exception) {
      throw TaskException(errorMessage: exception.message ?? exception.code);
    } catch (exception) {
      throw TaskException(errorMessage: exception.toString());
    }
  }
}
