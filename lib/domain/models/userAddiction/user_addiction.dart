import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_addiction.freezed.dart';
part 'user_addiction.g.dart';

@freezed
class UserAddiction with _$UserAddiction {
  const factory UserAddiction({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'userId') required String userId,
    required String addiction,
    double? costPerDay,
    int? timeSpentPerDay,
    @Default([]) List<String> motivation,
  }) = _UserAddiction;

  factory UserAddiction.fromJson(Map<String, Object?> json) =>
      _$UserAddictionFromJson(json);
}
