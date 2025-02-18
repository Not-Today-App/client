import 'package:client/data/services/api/api_url.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:client/utils/results.dart';
import 'package:logging/logging.dart';

class LoggingLink extends Link {
  final _log = Logger('LoggingLink');

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    // Log the headers
    _log.info(
        'Request Headers: ${request.context.entry<HttpLinkHeaders>()?.headers}');

    // Forward the request to the next link
    yield* forward!(request);
  }
}

class ApiClient {
  ApiClient({GraphQLClient? client})
      : _client = client ??
            GraphQLClient(
              link: _createLink(),
              cache: GraphQLCache(),
            );

  final GraphQLClient _client;

  static Link _createLink() {
    final httpLink = HttpLink(ApiUrl.baseUrl);

    final authLink = AuthLink(
      getToken: () async =>
          'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2N2E4ODUwMjM4MzYyYzdhNTg3ZmFiYmEiLCJyb2xlIjoiQVBQTElDQVRJT05fVVNFUiIsImlhdCI6MTczOTkwMzkyMiwiZXhwIjoxNzcxNDYxNTIyfQ.iKkW56gWsDB3fDD3zh8OkK47ifpXYrCnlijCbPu-aN3nqYV-fs5o1S6Tdq2wKi2MBJOj-7ODX_tMfXdVasBoTQP0s0tZgdjW4o6HnwOEU36kdbL875olsF6kJYzXaxXeXoXy-bz-WCXAHYaUC4jz88nUK5Cg8wGSjGpgZSWoEVaTIrWHQs9-DMqfyJlkFmm4rh7WRFduvOjFVcAZAgyzGZ_WoAeJTjvB8mH0v9HXA01LuNHC7McLe6sgRtogU-lJMMVSZbNt3SZLnqEtfToUTCiyrJ-eS440JD93BIARlOyJUyKUOgqkwzd9jGA9MGCEcWwjK31jzKFB2VyzCYjKUYcMsHLsMUgUCbRTeeyEiuYNBvWCy9dZOEY2RKBA4Kqz-QmVbmb1cbYeyu5DOUG5K_paLAloRpecc7oqml5tCB9LY1XQ-x7g6qtZ7Ng8FPzKwyhE1RLfhYaiyEME5Ya0iWBfmbz25VfBxtAczRh-QQqS2Rr6ClneQjfEey5nuBMCKlebEreuh0Cwp3lUlYQXZJDC64gKj_xcjNfEVh8SebMDtdVK8OwI1HPQ5INIIq02pTOSWmnnr-vr-oWPs44xUWz2MfUJ6sIKgZuqxlTLsIaiP7yTqOaa23EHbcZLYTCenIP-q--3IFfDi58QDNBtnBR9B9fFnpePDkivG_i-iq4',
      headerKey: 'x-access-token',
    );
    // return authLink.concat(httpLink);
    final LoggingLink loggingLink = LoggingLink();
    return loggingLink.concat(authLink).concat(httpLink);
  }

  GraphQLClient get client => _client;

  final _log = Logger('AddictionsViewModel');

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
        return Result.error(Exception(result.exception.toString()));
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
        return Result.error(Exception(result.exception.toString()));
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
