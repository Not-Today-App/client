import 'package:client/data/repositories/diary/diary_repository.dart';
import 'package:client/domain/models/diary/diary.dart';
import 'package:client/utils/command.dart';
import 'package:client/utils/results.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class DiariesViewModel extends ChangeNotifier {
  DiariesViewModel({required DiaryRepository diaryRepository})
      : _diaryRepository = diaryRepository {
    load = Command0(_load)..execute();
  }

  final DiaryRepository _diaryRepository;
  final _log = Logger('DiariesViewModel');

  List<Diary> _diaries = [];
  List<Diary> get diaries => _diaries;

  late Command0 load;

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
