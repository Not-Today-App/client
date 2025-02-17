import 'package:freezed_annotation/freezed_annotation.dart';

part 'addiction.freezed.dart';
part 'addiction.g.dart';

@freezed
class Addiction with _$Addiction {
  const factory Addiction({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') String? id,
    required String name,
    required String quitReason,
    @Default([]) List<String> symptoms,
    @Default([]) List<String> treatmentOptions,
    @Default([]) List<String> triggers,
  }) = _Addiction;

  factory Addiction.fromJson(Map<String, Object?> json) =>
      _$AddictionFromJson(json);
}
