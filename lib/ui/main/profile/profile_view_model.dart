import 'package:client/utils/results.dart';
import 'package:client/domain/models/user/user.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import '../../../../data/repositories/auth/auth_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/command.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository {
    logout = Command0(_logout);
    loadUser = Command0(_load)..execute();
  }

  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final _log = Logger('ProfileViewModel');

  late Command0 logout;
  late Command0 loadUser;

  User? _user;
  User get user => _user!;

  Future<Result<void>> _load() async {
    final result = await _userRepository.getUser();

    switch (result) {
      case Ok<User>():
        _user = result.value;
        notifyListeners();
      case Error<User>():
        _log.warning('Failed to load user details. Error: ${result.error}');
    }

    return Result.ok(null);
  }

  Future<Result<void>> _logout() async {
    final result = await _authRepository.logout();
    if (result is Error<void>) {
      _log.warning('Logout failed! ${result.error}');
    } else {
      _log.info('Logout successful.');
    }
    return result;
  }
}
