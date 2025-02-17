import 'package:client/data/services/api/api_client.dart';
import 'package:client/domain/models/addiction/addiction.dart';
import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/utils/results.dart';

const String getAddictionsQuery = '''
query Addictions {
  addictions {
    _id
    name
    quitReason
    symptoms
    treatmentOptions
    triggers
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
}
