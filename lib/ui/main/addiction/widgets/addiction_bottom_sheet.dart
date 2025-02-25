// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:go_router/go_router.dart';

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

class CreateAddictionSheet extends StatelessWidget {
  const CreateAddictionSheet({
    super.key,
    required this.options,
    required this.disabledOptions,
  });

  final List<String> options;
  final List<String> disabledOptions;

  IconData _getIconForAddiction(String addictionName) {
    switch (AddictionName.values.firstWhere(
        (e) => e.toString().split('.').last == addictionName,
        orElse: () => AddictionName.values.last)) {
      case AddictionName.ALCOHOL:
        return Icons.local_drink; // Alcohol icon
      case AddictionName.ATTENTION_SEEKING:
        return Icons.visibility; // Attention seeking icon
      case AddictionName.BAD_LANGUAGE:
        return Icons.warning; // Bad language icon
      case AddictionName.CAFFEINE:
        return Icons.coffee; // Caffeine icon
      case AddictionName.DAIRY:
        return Icons.icecream; // Dairy icon
      case AddictionName.DRUG:
        return Icons.medication; // Drug icon
      case AddictionName.FAST_FOOD:
        return Icons.fastfood; // Fast food icon
      case AddictionName.GAMBLING:
        return Icons.monetization_on; // Gambling icon
      case AddictionName.GAMING:
        return Icons.videogame_asset; // Gaming icon
      case AddictionName.NAIL_BITING:
        return Icons.pest_control; // Nail biting icon
      case AddictionName.PORN:
        return Icons.remove_red_eye; // Porn icon
      case AddictionName.PROCRASTINATION:
        return Icons.hourglass_empty; // Procrastination icon
      case AddictionName.SELF_HARM:
        return Icons.healing; // Self-harm icon
      case AddictionName.SMOKING:
        return Icons.smoking_rooms; // Smoking icon
      case AddictionName.SOCIAL_MEDIA:
        return Icons.share; // Social media icon
      case AddictionName.SOFT_DRINKS:
        return Icons.local_drink; // Soft drinks icon
      case AddictionName.SUGAR:
        return Icons.cake; // Sugar icon
      case AddictionName.VAPING:
        return Icons.vape_free; // Default icon
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      child: MyGradientShaderMask(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSizes.p24),
                ...options.map((option) => Column(
                      children: [
                        Opacity(
                          opacity: disabledOptions.contains(option) ? 0.3 : 1.0,
                          child: ListTile(
                              leading: Icon(_getIconForAddiction(option)),
                              title: Text(option.replaceAll('_', ' '),
                                  style: TextStyle(fontSize: 16)),
                              onTap: disabledOptions.contains(option)
                                  ? null
                                  : () => GoRouter.of(context).pop()),
                        ),
                        const SizedBox(height: AppSizes.p24),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyGradientShaderMask extends StatelessWidget {
  const MyGradientShaderMask({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.purple,
            Colors.transparent,
            Colors.transparent,
            Colors.purple
          ],
          stops: [
            0.0,
            0.1,
            0.9,
            1.0
          ], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: child,
    );
  }
}
