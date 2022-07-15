import 'package:flutter/material.dart';
import '../../../config/palette.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color? textColor;
  final Color? backgroundColor;
  final double? borderRadius;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(backgroundColor ?? secondaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
      ),
      onPressed: () => onTap(),
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
