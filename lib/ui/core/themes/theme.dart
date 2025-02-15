import "package:client/ui/core/themes/util.dart";
import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff765a0b),
      surfaceTint: Color(0xff765a0b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdf9b),
      onPrimaryContainer: Color(0xff5a4300),
      secondary: Color(0xff6b5d3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff4e0bb),
      onSecondaryContainer: Color(0xff52452a),
      tertiary: Color(0xff496547),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffcbebc5),
      onTertiaryContainer: Color(0xff324d31),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff4d4639),
      outline: Color(0xff7f7667),
      outlineVariant: Color(0xffd0c5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffe8c26c),
      primaryFixed: Color(0xffffdf9b),
      onPrimaryFixed: Color(0xff251a00),
      primaryFixedDim: Color(0xffe8c26c),
      onPrimaryFixedVariant: Color(0xff5a4300),
      secondaryFixed: Color(0xfff4e0bb),
      onSecondaryFixed: Color(0xff241a04),
      secondaryFixedDim: Color(0xffd7c4a0),
      onSecondaryFixedVariant: Color(0xff52452a),
      tertiaryFixed: Color(0xffcbebc5),
      onTertiaryFixed: Color(0xff062109),
      tertiaryFixedDim: Color(0xffafcfaa),
      onTertiaryFixedVariant: Color(0xff324d31),
      surfaceDim: Color(0xffe2d9cc),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff6eddf),
      surfaceContainerHigh: Color(0xfff0e7d9),
      surfaceContainerHighest: Color(0xffebe1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

/*   static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff463300),
      surfaceTint: Color(0xff765a0b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff87691c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff40351b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7a6b4d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff223c22),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff587455),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff141109),
      onSurfaceVariant: Color(0xff3c3529),
      outline: Color(0xff595244),
      outlineVariant: Color(0xff746c5d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffe8c26c),
      primaryFixed: Color(0xff87691c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6c5100),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7a6b4d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff615336),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff587455),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff405b3e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcec5b8),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff0e7d9),
      surfaceContainerHigh: Color(0xffe5dcce),
      surfaceContainerHighest: Color(0xffd9d0c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3a2a00),
      surfaceTint: Color(0xff765a0b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5d4600),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff362b11),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff54482c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff183218),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff355034),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff312b1f),
      outlineVariant: Color(0xff4f483b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffe8c26c),
      primaryFixed: Color(0xff5d4600),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff423000),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff54482c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3d3117),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff355034),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1e391f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0b8ab),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9efe2),
      surfaceContainer: Color(0xffebe1d4),
      surfaceContainerHigh: Color(0xffdcd3c6),
      surfaceContainerHighest: Color(0xffcec5b8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  } */

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe8c26c),
      surfaceTint: Color(0xffe8c26c),
      onPrimary: Color(0xff3f2e00),
      primaryContainer: Color(0xff5a4300),
      onPrimaryContainer: Color(0xffffdf9b),
      secondary: Color(0xffd7c4a0),
      onSecondary: Color(0xff3a2f15),
      secondaryContainer: Color(0xff52452a),
      onSecondaryContainer: Color(0xfff4e0bb),
      tertiary: Color(0xffafcfaa),
      onTertiary: Color(0xff1c361c),
      tertiaryContainer: Color(0xff324d31),
      onTertiaryContainer: Color(0xffcbebc5),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff17130b),
      onSurface: Color(0xffebe1d4),
      onSurfaceVariant: Color(0xffd0c5b4),
      outline: Color(0xff999080),
      outlineVariant: Color(0xff4d4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff765a0b),
      primaryFixed: Color(0xffffdf9b),
      onPrimaryFixed: Color(0xff251a00),
      primaryFixedDim: Color(0xffe8c26c),
      onPrimaryFixedVariant: Color(0xff5a4300),
      secondaryFixed: Color(0xfff4e0bb),
      onSecondaryFixed: Color(0xff241a04),
      secondaryFixedDim: Color(0xffd7c4a0),
      onSecondaryFixedVariant: Color(0xff52452a),
      tertiaryFixed: Color(0xffcbebc5),
      onTertiaryFixed: Color(0xff062109),
      tertiaryFixedDim: Color(0xffafcfaa),
      onTertiaryFixedVariant: Color(0xff324d31),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e392f),
      surfaceContainerLowest: Color(0xff110e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff231f17),
      surfaceContainerHigh: Color(0xff2e2921),
      surfaceContainerHighest: Color(0xff39342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

/*   static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd87f),
      surfaceTint: Color(0xffe8c26c),
      onPrimary: Color(0xff322300),
      primaryContainer: Color(0xffae8c3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffeedab5),
      onSecondary: Color(0xff2f240c),
      secondaryContainer: Color(0xff9f8f6e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffc5e5bf),
      onTertiary: Color(0xff112b12),
      tertiaryContainer: Color(0xff7b9877),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe6dbc9),
      outline: Color(0xffbbb1a0),
      outlineVariant: Color(0xff988f7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff5c4400),
      primaryFixed: Color(0xffffdf9b),
      onPrimaryFixed: Color(0xff181000),
      primaryFixedDim: Color(0xffe8c26c),
      onPrimaryFixedVariant: Color(0xff463300),
      secondaryFixed: Color(0xfff4e0bb),
      onSecondaryFixed: Color(0xff181000),
      secondaryFixedDim: Color(0xffd7c4a0),
      onSecondaryFixedVariant: Color(0xff40351b),
      tertiaryFixed: Color(0xffcbebc5),
      onTertiaryFixed: Color(0xff001603),
      tertiaryFixedDim: Color(0xffafcfaa),
      onTertiaryFixedVariant: Color(0xff223c22),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff49443a),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2c271f),
      surfaceContainerHigh: Color(0xff373229),
      surfaceContainerHighest: Color(0xff423d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffeed0),
      surfaceTint: Color(0xffe8c26c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe3be69),
      onPrimaryContainer: Color(0xff110a00),
      secondary: Color(0xffffeed0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd3c19d),
      onSecondaryContainer: Color(0xff110a00),
      tertiary: Color(0xffd8f9d2),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffaccba7),
      onTertiaryContainer: Color(0xff000f02),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffaeedc),
      outlineVariant: Color(0xffccc1b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff5c4400),
      primaryFixed: Color(0xffffdf9b),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe8c26c),
      onPrimaryFixedVariant: Color(0xff181000),
      secondaryFixed: Color(0xfff4e0bb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd7c4a0),
      onSecondaryFixedVariant: Color(0xff181000),
      tertiaryFixed: Color(0xffcbebc5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffafcfaa),
      onTertiaryFixedVariant: Color(0xff001603),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff554f45),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f17),
      surfaceContainer: Color(0xff353027),
      surfaceContainerHigh: Color(0xff403b31),
      surfaceContainerHighest: Color(0xff4c463c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  } */

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        appBarTheme: CustomWidgetStyles.getAppBarTheme(colorScheme),
        cardTheme: CustomWidgetStyles.getCardTheme(colorScheme),
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
