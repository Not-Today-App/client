import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

/// LoginResponse model.
@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    /// Access token for authentication.
    required String accessToken,

    /// Refresh token for session management.
    required String refreshToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
