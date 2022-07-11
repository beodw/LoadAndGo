import 'package:flutter/material.dart';
import '../../../config/palette.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SideBarTile extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final bool sideBarIsOpen;
  final IconData icon;
  final bool isSelected;
  final Duration textAnimationDuration = const Duration(milliseconds: 30);
  final BorderRadius roundedCorners =
      const BorderRadius.all(Radius.circular(8));
  const SideBarTile({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.sideBarIsOpen,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon leadingIcon = Icon(
      icon,
      color: iconPrimaryColor,
      size: defaultIconSizeLg,
    );
    dynamic tileText = sideBarIsOpen
        ? AnimatedTextKit(
            onTap: onPressed,
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText(title, speed: textAnimationDuration),
            ],
          )
        : Icon(
            icon,
            color: iconPrimaryColor,
            size: defaultIconSizeLg,
          );
    return Material(
      color: transparent,
      type: MaterialType.canvas,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: roundedCorners),
        tileColor: isSelected ? sideBarButtonSelectedColor : null,
        hoverColor: onHoverColor,
        iconColor: Colors.black,
        onTap: onPressed,
        title: tileText,
        leading: sideBarIsOpen ? leadingIcon : null,
      ),
    );
  }
}
