import 'package:flutter/material.dart';

class LoadingCircullarButton extends StatelessWidget {
  const LoadingCircullarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}
