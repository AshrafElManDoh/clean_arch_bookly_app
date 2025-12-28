import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.borderRadius,
    required this.textColor,
    this.onTap,
  });
  final String title;
  final Color backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final Color textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: AppStyles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
