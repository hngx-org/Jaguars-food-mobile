import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';

enum Accent {primary, secondary}

class GiftIconButton extends StatelessWidget {
  final Accent accent;
  final VoidCallback? onTap;
  const GiftIconButton({
    this.accent = Accent.primary,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.primaryContainer,
      Accent.secondary => Theme.of(context).colorScheme.secondaryContainer,
    };
    Color color = switch(accent){
      Accent.primary => Theme.of(context).colorScheme.primary,
      Accent.secondary => Theme.of(context).colorScheme.secondary,
    };
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: backgroundColor
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.giftIconPath,
              colorFilter: ColorFilter.mode(
                color,
                BlendMode.srcIn
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LunchIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  const LunchIconButton({
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Theme.of(context).colorScheme.secondaryContainer
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Image.asset(Assets.lunchImagePath),
            )
          ),
        ),
      ),
    );
  }
}