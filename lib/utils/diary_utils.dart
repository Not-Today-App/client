// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

enum Mood {
  HAPPY,
  RELAXED,
  PROUD,
  HOPEFUL,
  NEUTRAL,
  SAD,
  ANXIOUS,
  TIRED,
  ANGRY,
  OVERWHELMED,
  CALM,
  CONFUSED,
  EXCITED,
  GRATEFUL,
  LONELY,
}

class DiaryUtils {
  static Mood getMoodFromString(String moodString) {
    // Convert string to enum
    return Mood.values.firstWhere(
      (m) => m.toString() == 'Mood.$moodString',
      orElse: () => Mood.NEUTRAL, // Default value if not found
    );
  }

  static Color getBadgeColor(BuildContext context, Mood mood) {
    if (mood == Mood.HAPPY ||
        mood == Mood.RELAXED ||
        mood == Mood.PROUD ||
        mood == Mood.HOPEFUL ||
        mood == Mood.GRATEFUL ||
        mood == Mood.EXCITED ||
        mood == Mood.CALM) {
      return Theme.of(context).colorScheme.tertiaryContainer; // Happy moods
    } else if (mood == Mood.NEUTRAL) {
      return Theme.of(context).colorScheme.primaryContainer; // Neutral mood
    } else {
      return Color(
          0xFFEBC5C5); // Sad or angry moods (SAD, ANXIOUS, TIRED, ANGRY, OVERWHELMED, CONFUSED, LONELY)
    }
  }

  static Color getTextColor(BuildContext context, Mood mood) {
    if (mood == Mood.HAPPY ||
        mood == Mood.RELAXED ||
        mood == Mood.PROUD ||
        mood == Mood.HOPEFUL ||
        mood == Mood.GRATEFUL ||
        mood == Mood.EXCITED ||
        mood == Mood.CALM) {
      return Theme.of(context).colorScheme.onTertiaryContainer; // Happy moods
    } else if (mood == Mood.NEUTRAL) {
      return Theme.of(context).colorScheme.onPrimaryContainer; // Neutral mood
    } else {
      return Color(0xFF4D3331); // Sad or angry moods
    }
  }
}
