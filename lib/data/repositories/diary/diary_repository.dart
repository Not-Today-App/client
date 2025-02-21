import 'package:client/domain/models/diary/diary.dart';
import 'package:client/utils/results.dart';

abstract class DiaryRepository {
  Future<Result<List<Diary>>> getDiaries();
  Future<Result<Diary>> getDiaryById(String id);
  Future<Result<Diary>> createDiary(Diary diary);
  Future<Result<Diary>> updateDiary(Diary diary);
  Future<Result<void>> deleteDiary(String id);
}
