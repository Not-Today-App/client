import 'package:client/data/services/api/api_url.dart';
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
}
