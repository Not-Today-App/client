import 'package:client/domain/models/userAddiction/user_addiction.dart';
import 'package:client/utils/command.dart';
import 'package:client/utils/results.dart';
import 'package:flutter/material.dart';

import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/domain/models/addiction/addiction.dart';
import 'package:logging/logging.dart';

class AddictionsViewModel extends ChangeNotifier {
  AddictionsViewModel({
    required AddictionRepository addictionRepository,
  }) : _addictionRepository = addictionRepository {
    load = Command0(_load)..execute();
  }

  final AddictionRepository _addictionRepository;
  final _log = Logger('AddictionsViewModel');

  List<Addiction> _addictions = [];
  List<Addiction> get addictions => _addictions;

  List<UserAddiction> _userAddictions = [];
  List<UserAddiction> get userAddictions => _userAddictions;

  late Command0 load;

  Future<Result<void>> _load() async {
    final result = await _addictionRepository.getAddictions();
    switch (result) {
      case Ok<List<Addiction>>():
        _log.fine('Loaded addictions');
        _addictions = result.value;
        notifyListeners();
      case Error<List<Addiction>>():
        _log.warning('Failed to load addictions. Error: ${result.error}');
    }
    final userResult = await _addictionRepository.getUserAddictions();
    switch (userResult) {
      case Ok<List<UserAddiction>>():
        _log.fine('Loaded user addictions');
        _userAddictions = userResult.value;
        break;
      case Error<List<UserAddiction>>():
        _log.warning(
            'Failed to load user addictions. Error: ${userResult.error}');
    }

    // Notify listeners after both loads are completed
    notifyListeners();
    return Result.ok(null);
  }
}
