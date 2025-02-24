import 'package:client/data/services/api/api_url.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client/utils/results.dart';
import 'package:logging/logging.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({GraphQLClient? client})
      : _client = client ??
            GraphQLClient(
              link: _createLink(),
              cache: GraphQLCache(),
            );

  final GraphQLClient _client;
  static AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider provider) {
    _authHeaderProvider = provider;
  }

  static Link _createLink() {
    final httpLink = HttpLink(ApiUrl.baseUrl);

    final authLink = AuthLink(
      getToken: () async => _authHeaderProvider?.call(),
      headerKey: 'x-access-token',
    );

    return authLink.concat(httpLink);
  }

  GraphQLClient get client => _client;

  final _log = Logger('API Client');

  /// Executes a GraphQL query and returns the result.
  Future<Result<Map<String, dynamic>>> query(String query,
      {Map<String, dynamic>? variables}) async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(query),
        variables: variables ?? {},
      );

      final QueryResult result = await _client.query(options);

      _log.info('API Response: ${result.data}');
      _log.info('API Errors: ${result.exception}');

      if (result.hasException) {
        return Result.error(result.exception!);
      }

      if (result.data == null) {
        return Result.error(Exception("No data returned from the query"));
      }

      return Result.ok(result.data!);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  /// Executes a GraphQL mutation and returns the result.
  Future<Result<Map<String, dynamic>>> mutate(String mutation,
      {Map<String, dynamic>? variables}) async {
    try {
      final MutationOptions options = MutationOptions(
        document: gql(mutation),
        variables: variables ?? {},
      );

      final QueryResult result = await _client.mutate(options);

      if (result.hasException) {
        return Result.error(result.exception!);
      }

      if (result.data == null) {
        return Result.error(Exception("No data returned from the mutation"));
      }

      return Result.ok(result.data!);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
