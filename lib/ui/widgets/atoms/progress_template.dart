import 'package:flutter/material.dart';

class ProgressTemplate extends StatelessWidget {
  const ProgressTemplate({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
