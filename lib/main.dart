import 'package:client/config/dependencies.dart';
import 'package:client/data/services/api/api_client.dart';
import 'package:client/routing/router.dart';
import 'package:client/ui/core/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'ui/core/themes/util.dart';
import 'ui/core/themes/theme.dart';

List<SingleChildWidget> providers = [...providersLocal, ...providersRemote];

void main() async {
  Logger.root.level = Level.ALL;
  runApp(
    MultiProvider(
      providers: providers,
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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Barlow", "Oswald");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router(context.read()),
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: context.watch<ThemeController>().themeMode,
    );
  }
}
