import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:flutter/material.dart';

import '../../resource/theme/app_color.dart';

class AppButtonSocial extends StatelessWidget {
  const AppButtonSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buttonSocial(AppImages.imageGoogle),
        const SizedBox(width: 8),
        _buttonSocial(AppImages.imageApple),
        const SizedBox(width: 8),
        _buttonSocial(AppImages.imageFb),
      ],
    );
  }

  _buttonSocial(String path) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(54)),
          color: AppColors.kFCF3F6,
          border: Border.all(width: 1, color: AppColors.kF83758)),
      child: Center(
        child: Image.asset(
          path,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
