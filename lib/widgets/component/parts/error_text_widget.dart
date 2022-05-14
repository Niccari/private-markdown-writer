import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String errorText;
  final String recoverActionText;
  final Function() onActionPressed;
  const ErrorTextWidget({
    Key? key,
    required this.errorText,
    required this.recoverActionText,
    required this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8);

    return Wrap(
      children: [Column(
        children: [
          Text(errorText),
          const Padding(padding: padding),
          TextButton(
              onPressed: onActionPressed,
              child: Text(recoverActionText)
          ),
        ],
      )]
    );
  }
}
