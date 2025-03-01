import 'package:client/data/repositories/diary/diary_repository.dart';
import 'package:client/domain/models/diary/diary.dart';
import 'package:client/utils/command.dart';
import 'package:client/utils/results.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class DiariesViewModel extends ChangeNotifier {
  DiariesViewModel({required DiaryRepository diaryRepository})
      : _diaryRepository = diaryRepository {
    _log.info('🔥 DiariesViewModel CREATED');
    loadDiaries = Command0(_load)..execute();
    createDiary = Command1<Diary, Diary>(_createDiary);
    deleteDiary = Command1<void, String>(_deleteDiary);
    updateDiary = Command1<Diary, Diary>(_updateDiary);
    loadDiary = Command1<void, String>(_loadDiary);
  }

  final DiaryRepository _diaryRepository;
  final _log = Logger('DiariesViewModel');

  List<Diary> _diaries = [];
  List<Diary> get diaries => _diaries;

  Diary? _currentDiary;
  Diary? get currentDiary => _currentDiary; //ID

  late Command0 loadDiaries;
  late Command1 createDiary;
  late Command1 deleteDiary;
  late Command1 updateDiary;
  late Command1 loadDiary;

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

  Future<Result<Diary>> _updateDiary(Diary updatedDiary) async {
    final result = await _diaryRepository.updateDiary(updatedDiary);
    switch (result) {
      case Ok<Diary>():
        _log.fine('Diary updated successfully');
        // Find and update the diary in the list
        int index = _diaries.indexWhere((diary) => diary.id == updatedDiary.id);
        _currentDiary = updatedDiary;
        if (index != -1) {
          _diaries[index] = updatedDiary;
        }
        notifyListeners();

        return Result.ok(updatedDiary);
      case Error<Diary>():
        _log.warning('Failed to update diary. Error: ${result.error}');
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _deleteDiary(String diaryId) async {
    final result = await _diaryRepository.deleteDiary(diaryId);
    switch (result) {
      case Ok<void>():
        _log.fine('Diary deleted successfully');
        _diaries.removeWhere((diary) => diary.id == diaryId);
        notifyListeners();
        return Result.ok(null);
      case Error<void>():
        _log.warning('Failed to delete diary. Error: ${result.error}');
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _loadDiary(String diaryId) async {
    final result = await _diaryRepository.getDiaryById(diaryId);
    switch (result) {
      case Ok<Diary>():
        _log.fine('Loaded diary');
        _currentDiary = result.value;
        notifyListeners();
      case Error<Diary>():
        _log.warning('Failed to load diary. Error: ${result.error}');
    }
    return result;
  }
}
