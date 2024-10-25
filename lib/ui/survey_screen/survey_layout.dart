import 'package:flutter/material.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';

class SurveyLayout extends StatelessWidget {
  const SurveyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(context.s.hello_world),
        ],
      ),
    );
  }
}
