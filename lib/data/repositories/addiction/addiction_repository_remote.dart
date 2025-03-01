import 'package:client/data/services/api/api_client.dart';
import 'package:client/domain/models/addiction/addiction.dart';
import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/domain/models/userAddiction/user_addiction.dart';
import 'package:client/utils/results.dart';

const String getAddictionsQuery = '''
query Addictions {
  addictions {
    name
  }
}
''';

const String getUserAddictionsQuery = '''
query UserAddictions {
  userAddictions {
    _id
    userId
    addiction
    costPerDay
    timeSpentPerDay
    motivation
  }
}
''';

const String getAddictionByNameQuery = '''
query Query(\$input: GetAddictionInput!) {
  addiction(input: \$input) {
    _id
    name
    symptoms
    treatmentOptions
    triggers
    quitReason
  }
}
''';

const String getUserAddictionByNameQuery = '''
query UserAddiction(\$input: GetUserAddictionInput!) {
  userAddiction(input: \$input) {
    _id
    userId
    addiction
    costPerDay
    timeSpentPerDay
    motivation
  }
}
''';

class AddictionRepositoryRemote implements AddictionRepository {
  AddictionRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<List<Addiction>>> getAddictions() async {
    try {
      final result = await _apiClient.query(getAddictionsQuery);

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final addictionsData = result.value['addictions'] as List<dynamic>;
          final addictions = addictionsData
              .map((element) =>
                  Addiction.fromJson(element as Map<String, dynamic>))
              .toList();
          return Result.ok(addictions);

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<UserAddiction>>> getUserAddictions() async {
    try {
      final result = await _apiClient.query(getUserAddictionsQuery);

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final userAddictionsData =
              result.value['userAddictions'] as List<dynamic>;
          final userAddictions = userAddictionsData
              .map((element) =>
                  UserAddiction.fromJson(element as Map<String, dynamic>))
              .toList();
          return Result.ok(userAddictions);

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Addiction>> getAddictionByName(String name) async {
    try {
      final result = await _apiClient.query(
        getAddictionByNameQuery,
        variables: {
          'input': {'name': name}
        },
      );

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final addictionData =
              result.value['addiction'] as Map<String, dynamic>;
          return Result.ok(Addiction.fromJson(addictionData));

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<UserAddiction>> getUserAddictionByName(String name) async {
    try {
      final result = await _apiClient.query(
        getUserAddictionByNameQuery,
        variables: {
          'input': {'addiction': name}
        },
      );

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final userAddictionData =
              result.value['userAddiction'] as Map<String, dynamic>;
          return Result.ok(UserAddiction.fromJson(userAddictionData));

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
