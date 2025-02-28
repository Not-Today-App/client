// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum AddictionName {
  ALCOHOL,
  ATTENTION_SEEKING,
  BAD_LANGUAGE,
  CAFFEINE,
  DAIRY,
  DRUG,
  FAST_FOOD,
  GAMBLING,
  GAMING,
  NAIL_BITING,
  PORN,
  PROCRASTINATION,
  SELF_HARM,
  SMOKING,
  SOCIAL_MEDIA,
  SOFT_DRINKS,
  SUGAR,
  VAPING,
}

class AddictionUtils {
  static IconData getIconsFor(String addictionName) {
    switch (AddictionName.values.firstWhere(
      (e) => e.toString().split('.').last == addictionName,
      orElse: () => AddictionName.values.last,
    )) {
      case AddictionName.ALCOHOL:
        return Icons.local_drink;
      case AddictionName.ATTENTION_SEEKING:
        return Icons.visibility;
      case AddictionName.BAD_LANGUAGE:
        return Icons.warning;
      case AddictionName.CAFFEINE:
        return Icons.coffee;
      case AddictionName.DAIRY:
        return Icons.icecream;
      case AddictionName.DRUG:
        return Icons.medication;
      case AddictionName.FAST_FOOD:
        return Icons.fastfood;
      case AddictionName.GAMBLING:
        return Icons.monetization_on;
      case AddictionName.GAMING:
        return Icons.videogame_asset;
      case AddictionName.NAIL_BITING:
        return Icons.pest_control;
      case AddictionName.PORN:
        return Icons.remove_red_eye;
      case AddictionName.PROCRASTINATION:
        return Icons.hourglass_empty;
      case AddictionName.SELF_HARM:
        return Icons.healing;
      case AddictionName.SMOKING:
        return Icons.smoking_rooms;
      case AddictionName.SOCIAL_MEDIA:
        return Icons.share;
      case AddictionName.SOFT_DRINKS:
        return Icons.local_drink;
      case AddictionName.SUGAR:
        return Icons.cake;
      case AddictionName.VAPING:
        return Icons.vape_free;
    }
  }

  static Color getBadgeColor(BuildContext context, int level) {
    if (level == 1 || level == 2) {
      return Theme.of(context).colorScheme.tertiaryContainer;
    } else if (level >= 3 && level <= 5) {
      return Theme.of(context).colorScheme.primaryContainer;
    } else if (level == 6 || level == 7) {
      return const Color(0xFFEBC5C5);
    }
    return Colors.transparent;
  }

  static Color getTextColor(BuildContext context, int level) {
    if (level == 1 || level == 2) {
      return Theme.of(context).colorScheme.onTertiaryContainer;
    } else if (level >= 3 && level <= 5) {
      return Theme.of(context).colorScheme.onPrimaryContainer;
    } else if (level == 6 || level == 7) {
      return const Color(0xFF4D3331);
    }
    return Colors.black;
  }
}
