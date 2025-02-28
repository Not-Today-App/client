import 'package:client/data/repositories/diary/diary_repository.dart';
import 'package:client/data/services/api/api_client.dart';
import 'package:client/domain/models/diary/diary.dart';
import 'package:client/utils/results.dart';

const String createDiaryMutation = '''
mutation CreateDiary(\$input: CreateDiaryInput!) {
  createDiary(input: \$input) {
    _id
    userId
    title
    content
    mood
    createdAt
  }
}
''';

const String deleteDiaryMutation = '''
mutation DeleteDiary(\$input: DeleteDiaryInput!) {
  deleteDiary(input: \$input)
}
''';

const String updateDiaryMutation = '''
mutation UpdateDiary(\$input: UpdateDiaryInput!) {
  updateDiary(input: \$input) {
    _id
    userId
    title
    content
    mood
  }
}
''';

const String getDiaryByIdQuery = '''
query Query(\$input: GetDiaryInput!) {
  diary(input: \$input) {
    _id
    userId
    title
    content
    mood
  }
}
''';

const String getDiariesQuery = '''
query Diaries {
  diaries {
    _id
    userId
    title
    content
    mood
    createdAt
  }
}
''';

class DiaryRepositoryRemote extends DiaryRepository {
  DiaryRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<Diary>> createDiary(Diary diary) async {
    try {
      final result = await _apiClient.mutate(createDiaryMutation, variables: {
        'input': {
          'content': diary.content,
          'mood': diary.mood,
          'title': diary.title,
        }
      });

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final diaryData = result.value['createDiary'] as Map<String, dynamic>;
          return Result.ok(Diary.fromJson(diaryData));

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteDiary(String id) async {
    try {
      final result = await _apiClient.mutate(deleteDiaryMutation, variables: {
        'input': {
          '_id': id,
        }
      });

      switch (result) {
        case Ok<Map<String, dynamic>>():
          return Result.ok(null);

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Diary>> updateDiary(Diary diary) async {
    try {
      final result = await _apiClient.mutate(updateDiaryMutation, variables: {
        'input': {
          '_id': diary.id,
          'content': diary.content,
          'mood': diary.mood,
          'title': diary.title,
        }
      });

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final diaryData = result.value['updateDiary'] as Map<String, dynamic>;
          return Result.ok(Diary.fromJson(diaryData));

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Diary>>> getDiaries() async {
    try {
      final result = await _apiClient.query(getDiariesQuery);

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final diariesData = result.value['diaries'] as List<dynamic>;
          final diaries = diariesData
              .map((element) => Diary.fromJson(element as Map<String, dynamic>))
              .toList();
          return Result.ok(diaries);

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Diary>> getDiaryById(String id) async {
    try {
      final result = await _apiClient.query(getDiaryByIdQuery, variables: {
        'input': {'_id': id}
      });

      switch (result) {
        case Ok<Map<String, dynamic>>():
          final diaryData = result.value['diary'] as Map<String, dynamic>;
          return Result.ok(Diary.fromJson(diaryData));

        case Error<Map<String, dynamic>>():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
