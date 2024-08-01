import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/ui/routes/names.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.textButton,
    required this.textColor,
    required this.backgroundColor,
  });

  final String textButton;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RoutesNames.listNews);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(textButton),
    );
  }
}
