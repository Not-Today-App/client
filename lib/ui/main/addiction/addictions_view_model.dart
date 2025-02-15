import 'package:client/data/services/local/local_data_service.dart';
import 'package:client/utils/command.dart';
import 'package:client/utils/results.dart';
import 'package:flutter/material.dart';

import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/data/repositories/user/user_repository.dart';
import 'package:client/domain/models/addiction/addiction.dart';
import 'package:client/domain/models/user/user.dart';
import 'package:logging/logging.dart';

/* 

IN THE FUTURE MAKE THIS MORE COMPLEX
WHEN USING REPOSITORIES
WITH TRY CATCHES
LOAD
ETC.

 */

class AddictionsViewModel extends ChangeNotifier {
  AddictionsViewModel({
    required LocalDataService localDataService,
    required AddictionRepository addictionRepository,
    required UserRepository userRepository,
  })  : _localDataService = localDataService,
        _addictionRepository = addictionRepository,
        _userRepository = userRepository {
    load = Command0(_load)..execute();
  }

  final LocalDataService _localDataService;
  final AddictionRepository _addictionRepository;
  final UserRepository _userRepository;
  final _log = Logger('AddictionsViewModel');

  User? _user;
  User? get user => _user;

  List<Addiction> _addictions = [];
  List<Addiction> get addictions => _addictions;

  late Command0 load;

  Future<Result> _load() async {
    try {
      _user = _localDataService.getUser();
      final result = await _localDataService.getAddictions();
      _addictions = result;
      _log.fine('Loaded addictions: ${_addictions.length}');
      return Result.ok(null);
    } catch (e) {
      _log.severe('Error loading addictions: $e');
      return Result.error(e as Exception);
    } finally {
      notifyListeners();
    }
  }
}
