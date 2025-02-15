import 'dart:async';

import 'package:client/domain/models/addiction/addiction.dart';
import 'package:client/utils/results.dart';
import '../../services/local/local_data_service.dart';
import 'addiction_repository.dart';

class AddictionRepositoryLocal implements AddictionRepository {
  AddictionRepositoryLocal({required LocalDataService localDataService})
      : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<List<Addiction>>> getAddictions() async {
    final addictions = await _localDataService.getAddictions();
    return Result.ok(addictions);
  }
}
