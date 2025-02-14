import 'package:client/utils/routes.dart';
import 'package:flutter/material.dart';
import 'styles/util.dart';
import 'styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Barlow", "Oswald");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        initialRoute: AppRoutes.menuPage,
        routes: AppRoutes.getRoutes());
  }
}
