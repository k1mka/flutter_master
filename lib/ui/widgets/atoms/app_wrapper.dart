import 'package:flutter/material.dart';
import 'package:flutter_master/ui/widgets/tokens/spacings.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SpecificSpacings.pagePadding,
      child: child,
    );
  }
}
