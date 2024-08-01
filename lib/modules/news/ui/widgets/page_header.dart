import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHeader extends StatefulWidget {
  const PageHeader({super.key, this.textTitle, this.fontSize, this.color});

  final String? textTitle;
  final double? fontSize;
  final MaterialColor? color;

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> {
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
