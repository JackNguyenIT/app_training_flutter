import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:app_demo_flutter/resource/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resource/theme/app_style.dart';
import '../widget/app_text_button.dart';
import '../widget/text_form_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot\npassword?",
                    style: AppStyles.styleBold.copyWith(fontSize: 32),
                  ),
                  const SizedBox(height: 36),
                  TextFormWidget(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset(
                          AppImages.icEmail,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      textHint: "Enter your email address"),
                  const SizedBox(height: 20),
                  Text.rich(
                    TextSpan(
                      text: "* ",
                      style: AppStyles.styleRegular.copyWith(
                        fontSize: 12,
                        color: AppColors.kF83758,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "We will send you a message to set or reset your new password",
                            style: AppStyles.styleRegular.copyWith(
                              color: AppColors.k575757,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 52),
                  AppTextButton(
                    title: "Submit",
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
