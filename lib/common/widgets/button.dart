import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final EdgeInsets? padding;
  final GestureTapCallback? onPressed;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? radius;

  const Button({
    Key? key,
    required this.text,
    this.onPressed,
    this.padding,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w600,
    this.fontColor = Colors.red,
    this.backgroundColor = Colors.red,
    this.borderColor,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: BorderRadius.circular(radius!),
          color: backgroundColor,
        ),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        child: Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

class TederaTextButton extends StatelessWidget {
  const TederaTextButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.textStyle,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // TODO
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.black.withOpacity(0.05)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            // side: const BorderSide(color: Colors.red),
          ),
        ),
      ),
      child: Text(
        label,
        style: textStyle ?? textStyle!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
