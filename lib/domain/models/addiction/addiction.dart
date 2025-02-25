import 'package:freezed_annotation/freezed_annotation.dart';

part 'addiction.freezed.dart';
part 'addiction.g.dart';

@freezed
class Addiction with _$Addiction {
  const factory Addiction({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') String? id,
    required String? name,
    required String? quitReason,
    List<String>? symptoms,
    List<String>? treatmentOptions,
    List<String>? triggers,
  }) = _Addiction;

  factory Addiction.fromJson(Map<String, Object?> json) =>
      _$AddictionFromJson(json);
}
