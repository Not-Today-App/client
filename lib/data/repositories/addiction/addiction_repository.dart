import 'package:client/domain/models/addiction/addiction.dart';
import 'package:client/utils/results.dart';

/// Data source for addiction related data
abstract class AddictionRepository {
  /// Get all addictions
  Future<Result<List<Addiction>>> getAddictions();
}
