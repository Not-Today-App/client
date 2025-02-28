import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary.freezed.dart';
part 'diary.g.dart';

@freezed
class Diary with _$Diary {
  const factory Diary({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') String? id,
    String? userId,
    required String title,
    required String content,
    required String mood,
    DateTime? createdAt,
  }) = _Diary;

  factory Diary.fromJson(Map<String, Object?> json) => _$DiaryFromJson(json);
}
