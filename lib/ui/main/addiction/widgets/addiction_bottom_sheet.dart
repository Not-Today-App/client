// ignore_for_file: constant_identifier_names

import 'package:client/utils/addiction_utils.dart';
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
                              leading: Icon(AddictionUtils.getIconsFor(option)),
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
