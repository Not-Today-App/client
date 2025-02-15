import 'package:client/domain/models/user/user.dart';
import 'package:client/utils/results.dart';

/// Data source for user-related data
abstract class UserRepository {
  /// Returns the current user
  Future<Result<User>> getUser();
}
