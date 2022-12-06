import 'package:todo_clean_solid/features/tasks/domain/usecases/generate_random_id/generate_random_id_usecase.dart';
import 'package:uuid/uuid.dart';

class GenerateRandomIdUsecaseImpl implements GenerateRandomIdUsecase {
  final Uuid _uuid;

  GenerateRandomIdUsecaseImpl({required Uuid uuid}) : _uuid = uuid;

  @override
  String call() => _uuid.v4();
}
