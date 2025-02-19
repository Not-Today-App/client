import 'package:client/data/repositories/addiction/addiction_repository.dart';
import 'package:client/domain/models/addiction/addiction.dart';
import 'package:client/domain/models/userAddiction/user_addiction.dart';
import 'package:client/utils/command.dart';
import 'package:client/utils/results.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class AddictionViewModel extends ChangeNotifier {
  AddictionViewModel({
    required AddictionRepository addictionRepository,
  }) : _addictionRepository = addictionRepository {
    loadAddiction = Command1(_load);
  }

  final AddictionRepository _addictionRepository;
  final _log = Logger('AddictionViewModel');

  String? _addictionName;
  String? get addictionName => _addictionName;

  Addiction? _addiction;
  Addiction? get addiction => _addiction;

  UserAddiction? _userAddiction;
  UserAddiction? get userAddiction => _userAddiction;

  late Command1<void, String> loadAddiction;

  Future<Result<void>> _load(String name) async {
    _addictionName = name;
    final addictionResult = await _addictionRepository.getAddictionByName(name);
    final userAddictionResult =
        await _addictionRepository.getUserAddictionByName(name);

    switch (addictionResult) {
      case Ok<Addiction>():
        _addiction = addictionResult.value;
      case Error<Addiction>():
        _log.warning(
            'Failed to load addiction details. Error: ${addictionResult.error}');
    }

    switch (userAddictionResult) {
      case Ok<UserAddiction>():
        _userAddiction = userAddictionResult.value;
      case Error<UserAddiction>():
        _log.warning(
            'Failed to load user addiction details. Error: ${userAddictionResult.error}');
    }

    notifyListeners();
    return Result.ok(null);
  }
}
