import 'package:client/domain/models/addiction/addiction.dart';
import 'package:client/domain/models/userAddiction/user_addiction.dart';
import 'package:client/utils/results.dart';

/// Data source for addiction related data
abstract class AddictionRepository {
  Future<Result<List<Addiction>>> getAddictions();

  Future<Result<List<UserAddiction>>> getUserAddictions();

  Future<Result<Addiction>> getAddictionByName(String name);

  Future<Result<UserAddiction>> getUserAddictionByName(String name);
}
