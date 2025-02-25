import 'package:client/data/repositories/diary/diary_repository.dart';
import 'package:client/domain/models/diary/diary.dart';
import 'package:client/utils/command.dart';
import 'package:client/utils/results.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class DiaryViewModel extends ChangeNotifier {
  DiaryViewModel({
    required DiaryRepository diaryRepository,
  }) : _diaryRepository = diaryRepository {
    loadDiary = Command1(_load);
    updateDiary = Command1<Diary, Diary>(_updateDiary);
    deleteDiary = Command1(_delete);
  }

  final DiaryRepository _diaryRepository;
  final _log = Logger('DiaryViewModel');

  String? _diaryId;
  String? get diaryId => _diaryId;

  Diary? _diary;
  Diary? get diary => _diary;

  // -----------------------------------------------------------------------

  late Command1<void, String> loadDiary;

  Future<Result<void>> _load(String id) async {
    _diaryId = id;
    final diaryResult = await _diaryRepository.getDiaryById(id);

    switch (diaryResult) {
      case Ok<Diary>():
        _diary = diaryResult.value;
      case Error<Diary>():
        _log.warning('Failed to load diary. Error: ${diaryResult.error}');
    }

    notifyListeners();
    return Result.ok(null);
  }

  // -----------------------------------------------------------------------

  late Command1<void, String> deleteDiary;

  Future<Result<void>> _delete(String id) async {
    final result = await _diaryRepository.deleteDiary(id);
    return result;
  }

  // -----------------------------------------------------------------------

  late Command1 updateDiary;

  Future<Result<Diary>> _updateDiary(Diary diary) async {
    final result = await _diaryRepository.updateDiary(diary);
    switch (result) {
      case Ok<Diary>():
        _log.fine('Diary updated successfully');
        notifyListeners();
        return Result.ok(result.value);
      case Error<Diary>():
        _log.warning('Failed to create diary. Error: ${result.error}');
        return Result.error(result.error);
    }
  }
}
