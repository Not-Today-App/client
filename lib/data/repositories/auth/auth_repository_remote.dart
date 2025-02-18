import 'package:client/data/services/api/api_client.dart';
import 'package:client/data/services/api/model/login_request/login_request.dart';
import 'package:client/data/services/api/model/login_response/login_response.dart';
import 'package:client/data/services/shared_preferences_service.dart';
import 'package:client/utils/results.dart';
import 'package:logging/logging.dart';
import '../../services/api/auth_api_client.dart';
import 'auth_repository.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required ApiClient apiClient,
    required AuthApiClient authApiClient,
    required SharedPreferencesService sharedPreferencesService,
  })  : _apiClient = apiClient,
        _authApiClient = authApiClient,
        _sharedPreferencesService =
            sharedPreferencesService; /* {
    _apiClient.authHeaderProvider = _authHeaderProvider;
  } */

  final AuthApiClient _authApiClient;
  final ApiClient _apiClient;
  final SharedPreferencesService _sharedPreferencesService;

  bool? _isAuthenticated;
  String? _authToken;
  final _log = Logger('AuthRepositoryRemote');

  // Fetch the token from shared preferences
  Future<void> _fetch() async {
    final result = await _sharedPreferencesService.fetchToken();
    switch (result) {
      case Ok<String?>():
        _authToken = result.value;
        _isAuthenticated = result.value != null;
        break;
      case Error<String?>():
        _log.severe(
            'Failed to fetch Token from SharedPreferences', result.error);
        break;
    }
  }

  @override
  Future<bool> get isAuthenticated async {
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }
    await _fetch();
    return _isAuthenticated ?? false;
  }

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _authApiClient.login(
        LoginRequest(email: email, password: password),
      );

      if (result is Ok<LoginResponse>) {
        // Check if it's a success
        _log.info('User logged in');
        _isAuthenticated = true;
        _authToken = result.value.accessToken;
        return await _sharedPreferencesService
            .saveToken(result.value.accessToken);
      } else if (result is Error<LoginResponse>) {
        // Check if it's an error
        _log.warning('Error logging in: ${result.error}');
        return Result.error(
            result.error); // Access the error from Error<LoginResponse>
      } else {
        // Handle the case where the result is neither Ok nor Error
        return Result.error(Exception("Unexpected result type"));
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    _log.info('User logged out');
    try {
      // Clear stored auth token
      final result = await _sharedPreferencesService.saveToken(null);
      if (result is Error<void>) {
        _log.severe('Failed to clear stored auth token');
      }

      // Clear token in ApiClient
      _authToken = null;

      // Clear authenticated status
      _isAuthenticated = false;
      return result;
    } finally {
      notifyListeners();
    }
  }

/*   String? _authHeaderProvider() =>
      _authToken != null ? 'Bearer $_authToken' : null; */
}
