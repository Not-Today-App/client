import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary.freezed.dart';
part 'diary.g.dart';

@freezed
class Diary with _$Diary {
  const factory Diary({
    @JsonKey(name: '_id') String? id,
    required String userId,
    required String title,
    required String content,
    required String mood,
    required DateTime createdAt,
  }) = _Diary;

  factory Diary.fromJson(Map<String, Object?> json) => _$DiaryFromJson(json);
}
