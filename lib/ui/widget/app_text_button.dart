import 'package:flutter/material.dart';

import '../../resource/theme/app_color.dart';
import '../../resource/theme/app_style.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final bool isStretchWidth;
  final double textSize;
  const AppTextButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.isStretchWidth = true,
      this.textSize = 20});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          minimumSize:
              Size(isStretchWidth ? double.infinity : 0, double.minPositive),
          backgroundColor: AppColors.kF83758),
      child: Text(
        title,
        style: AppStyles.styleMedium.copyWith(
          fontSize: textSize,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
