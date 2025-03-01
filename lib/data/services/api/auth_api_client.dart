import 'package:client/data/services/api/api_url.dart';
import 'package:client/data/services/api/model/register_request/register_request.dart';
import 'package:client/utils/results.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'model/login_request/login_request.dart';
import 'model/login_response/login_response.dart';

class AuthApiClient {
  AuthApiClient({GraphQLClient? client})
      : _client = client ??
            GraphQLClient(
              link: HttpLink(ApiUrl.baseUrl),
              cache: GraphQLCache(),
            );

  final GraphQLClient _client;

  Future<Result<LoginResponse>> login(LoginRequest loginRequest) async {
    const String loginMutation = '''
      mutation Login(\$input: LoginInput!) {
        login(input: \$input) {
          accessToken
          refreshToken
        }
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(loginMutation),
      variables: {
        'input': loginRequest.toJson(),
      },
    );

    try {
      final QueryResult result = await _client.mutate(options);

      if (result.hasException) {
        return Result.error(Exception(result.exception.toString()));
      }

      final data = result.data?['login'];
      if (data == null) {
        return Result.error(Exception("Invalid login response"));
      }

      return Result.ok(LoginResponse.fromJson(data));
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<Result<String>> register(RegisterRequest registerRequest) async {
    const String registerMutation = '''
      mutation Mutation(\$input: RegisterInput!) {
        register(input: \$input)
      }
    ''';

    final MutationOptions options = MutationOptions(
      document: gql(registerMutation),
      variables: {
        'input': registerRequest.toJson(),
      },
    );

    try {
      final QueryResult result = await _client.mutate(options);

      if (result.hasException) {
        return Result.error(Exception(result.exception.toString()));
      }

      final data = result.data?['register'];
      if (data == null) {
        return Result.error(Exception("Invalid registration response"));
      }

      return Result.ok(data as String);
    } on Exception catch (error) {
      return Result.error(error);
    }
  }
}
