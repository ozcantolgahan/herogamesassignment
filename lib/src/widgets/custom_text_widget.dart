import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  const CText(this.text,
      {super.key, this.style, this.align, this.overflow, this.maxLines});
  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
