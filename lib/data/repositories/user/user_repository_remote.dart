import 'package:client/data/services/api/api_client.dart';
import 'package:client/domain/models/user/user.dart';
import 'package:client/utils/results.dart';
import './user_repository.dart';

const String getUserQuery = '''
query Me {
  me {
    _id
    username
    picture
    email
    createdAt
  }
}
''';

class UserRepositoryRemote implements UserRepository {
  UserRepositoryRemote({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<User>> getUser() async {
    try {
      final result = await _apiClient.query(getUserQuery);

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final userData = result.value['me'] as Map<String, dynamic>;
          return Result.ok(User.fromJson(userData));

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
