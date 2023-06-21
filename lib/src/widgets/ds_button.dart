import 'package:flutter/material.dart';

class DSButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;

  const DSButton({
    super.key,
    this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
