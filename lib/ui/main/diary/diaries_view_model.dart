import 'package:client/data/repositories/diary/diary_repository.dart';
import 'package:client/domain/models/diary/diary.dart';
import 'package:client/utils/command.dart';
import 'package:client/utils/results.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class DiariesViewModel extends ChangeNotifier {
  DiariesViewModel({required DiaryRepository diaryRepository})
      : _diaryRepository = diaryRepository {
    loadDiaries = Command0(_load)..execute();
    createDiary = Command1<Diary, Diary>(_createDiary);
  }

  final DiaryRepository _diaryRepository;
  final _log = Logger('DiariesViewModel');

  List<Diary> _diaries = [];
  List<Diary> get diaries => _diaries;

  late Command0 loadDiaries;
  late Command1 createDiary;

  Future<Result<Diary>> _createDiary(Diary diary) async {
    final result = await _diaryRepository.createDiary(diary);
    switch (result) {
      case Ok<Diary>():
        _log.fine('Diary created successfully');
        _diaries.add(result.value);
        notifyListeners();
        return Result.ok(result.value);
      case Error<Diary>():
        _log.warning('Failed to create diary. Error: ${result.error}');
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _load() async {
    final result = await _diaryRepository.getDiaries();
    switch (result) {
      case Ok<List<Diary>>():
        _log.fine('Loaded diaries');
        _diaries = result.value;
        notifyListeners();
      case Error<List<Diary>>():
        _log.warning('Failed to load diaries. Error: ${result.error}');
    }
    return result;
  }
}
