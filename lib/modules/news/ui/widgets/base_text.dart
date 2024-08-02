import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseText extends StatefulWidget {
  const BaseText({super.key, this.textTitle, this.fontSize, this.color});

  final String? textTitle;
  final double? fontSize;
  final dynamic color;

  @override
  State<BaseText> createState() => _BaseTextState();
}

class _BaseTextState extends State<BaseText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.textTitle ?? 'Default Title',
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            fontSize: widget.fontSize ?? 30,
            fontWeight: FontWeight.bold,
            color: widget.color ?? Colors.blue,
          ),
        ));
  }
}
