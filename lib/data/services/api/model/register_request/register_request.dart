import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

/// LoginResponse model.
@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String email,
    required String password,
    required String username,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, Object?> json) =>
      _$RegisterRequestFromJson(json);
}
