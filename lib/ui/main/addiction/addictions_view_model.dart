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
    final addictionResult = await _addictionRepository.getAddictions();
    final userAddictionResult = await _addictionRepository.getUserAddictions();

    bool success = true;

    switch (addictionResult) {
      case Ok<List<Addiction>>():
        _log.fine('Loaded addictions');
        _addictions = addictionResult.value;
      case Error<List<Addiction>>():
        _log.warning(
            'Failed to load addictions. Error: ${addictionResult.error}');
        success = false;
    }

    switch (userAddictionResult) {
      case Ok<List<UserAddiction>>():
        _log.fine('Loaded user addictions');
        _userAddictions = userAddictionResult.value;
      case Error<List<UserAddiction>>():
        _log.warning(
            'Failed to load user addictions. Error: ${userAddictionResult.error}');
        success = false;
    }

    notifyListeners();

    return success
        ? Result.ok(null)
        : Result.error(
            Exception('Failed to load user addictions or addictions'));
  }
}
