import 'package:graphql_flutter/graphql_flutter.dart';

sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.ok(T value) = Ok._;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.error(Exception error) = Error._;
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> {
  const Ok._(this.value);

  /// Returned value in result
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// Subclass of Result for errors
final class Error<T> extends Result<T> {
  const Error._(this.error);

  /// Returned error in result
  final Exception error;

  String get errorMessage {
    if (error is OperationException) {
      final operationException = error as OperationException;
      if (operationException.graphqlErrors.isNotEmpty) {
        return operationException.graphqlErrors.first.message;
      }
    }
    return error.toString(); // Fallback for non-GraphQL errors
  }

  @override
  String toString() => 'Result<$T>.error($error)';
}
