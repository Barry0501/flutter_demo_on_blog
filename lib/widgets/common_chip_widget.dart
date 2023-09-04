import 'package:flutter/material.dart';

class CommonChipWidget extends StatelessWidget {
  const CommonChipWidget({
    super.key,
    required this.text,
    this.bgColor,
    this.textColor,
    this.padding,
    this.hasBorder = false,
  });

  final String text;
  final Color? bgColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
      ),
    );
  }
}
