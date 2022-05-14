import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40.0,
      height: 40.0,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
