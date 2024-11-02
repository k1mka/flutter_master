import 'package:flutter/material.dart';
import 'package:flutter_master/core/theme/palette.dart';
import 'package:flutter_master/ui/widgets/tokens/radiuses.dart';
import 'package:flutter_master/ui/widgets/tokens/spacings.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;

  const CustomIconButton._({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
  });

  factory CustomIconButton.success({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomIconButton._(
      label: label,
      icon: Icons.check,
      backgroundColor: Palette.greenColor,
      iconColor: Palette.white,
      onPressed: onPressed,
    );
  }

  factory CustomIconButton.error({
    required String label,
    required VoidCallback onPressed,
  }) {
    return CustomIconButton._(
      label: label,
      icon: Icons.error,
      backgroundColor: Palette.redColor,
      iconColor: Palette.white,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: Radiuses.borderRadius12,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor),
          Spacings.spacer8,
          Text(label, style: const TextStyle(color: Palette.white)),
        ],
      ),
    );
  }
}
