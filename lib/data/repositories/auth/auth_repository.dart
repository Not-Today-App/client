import 'package:client/utils/results.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRepository extends ChangeNotifier {
  Future<bool> get isAuthenticated;
  Future<Result<void>> login({required String email, required String password});
  Future<Result<void>> logout();
}
