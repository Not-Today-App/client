import 'package:client/config/dependencies.dart';
import 'package:client/data/services/api/api_client.dart';
import 'package:client/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'ui/core/themes/util.dart';
import 'ui/core/themes/theme.dart';

void main() async {
  Logger.root.level = Level.ALL;
  runApp(
    MultiProvider(
      providers: providersRemote,
      child: Builder(
        builder: (context) {
          final apiClient = context.read<ApiClient>();
          return GraphQLProvider(
            client: ValueNotifier(apiClient.client),
            child: const MyApp(),
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Barlow", "Oswald");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: router(context.read()),
    );
  }
}
