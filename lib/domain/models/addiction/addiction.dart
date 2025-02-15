import 'package:freezed_annotation/freezed_annotation.dart';

part 'addiction.freezed.dart';
part 'addiction.g.dart';

@freezed
class Addiction with _$Addiction {
  const factory Addiction({
    /// The name of the addiction.
    required String name,

    /// List of symptoms associated with the addiction.
    required List<String> symptoms,
  }) = _Addiction;

  factory Addiction.fromJson(Map<String, Object?> json) =>
      _$AddictionFromJson(json);
}
