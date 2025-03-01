import 'package:client/data/repositories/auth/auth_repository.dart';
import 'package:client/utils/command.dart';
import 'package:client/utils/results.dart';
import 'package:logging/logging.dart';

class RegisterViewModel {
  RegisterViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    register =
        Command1<void, ({String email, String password, String username})>(
            _register);
  }

  final AuthRepository _authRepository;
  final _log = Logger('RegisterViewModel');

  late Command1<void, ({String email, String password, String username})>
      register;

  Future<Result<void>> _register(
      ({String email, String password, String username}) credentials) async {
    final result = await _authRepository.register(
      email: credentials.email,
      password: credentials.password,
      username: credentials.username,
    );

    if (result is Error<void>) {
      _log.warning('Register failed! ${result.error}');
    }

    return result;
  }
}
