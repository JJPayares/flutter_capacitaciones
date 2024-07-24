import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.textButton,
  });

  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(textButton),
    );
  }
}
