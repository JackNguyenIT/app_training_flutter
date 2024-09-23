import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resource/theme/app_color.dart';
import '../../resource/theme/app_style.dart';
import '../../router/route_page.dart';
import '../widget/app_button_social.dart';
import '../widget/app_text_button.dart';
import '../widget/text_form_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                    "Create an\naccount",
                    style: AppStyles.styleBold.copyWith(fontSize: 32),
                  ),
                  const SizedBox(height: 36),
                  TextFormWidget(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset(
                          AppImages.icUser,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      textHint: "Username or Email"),
                  const SizedBox(height: 10),
                  TextFormWidget(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        AppImages.icPassword,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    textHint: "Password",
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  TextFormWidget(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        AppImages.icPassword,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    textHint: "ConfirmPassword",
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "By clicking the ",
                      style: AppStyles.styleRegular.copyWith(
                        fontSize: 12,
                        color: AppColors.k575757,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Register",
                            style: AppStyles.styleMedium.copyWith(
                              color: AppColors.kF83758,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(SIGN_UP_PAGE);
                              }),
                        TextSpan(
                            text: " button, you agree to the public offer",
                            style: AppStyles.styleRegular.copyWith(
                              color: AppColors.k575757,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 52),
                  AppTextButton(
                    title: "Create Account",
                    onTap: () {
                      Navigator.of(context).pushNamed(MAIN_PAGE);
                    },
                  ),
                  const SizedBox(height: 52),
                  Align(
                    child: Text("- OR Continue with -",
                        style: AppStyles.styleMedium.copyWith(
                          fontSize: 12,
                          color: AppColors.k575757,
                        )),
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    child: AppButtonSocial(),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    child: Text.rich(
                      TextSpan(
                        text: "I Already Have an Account ",
                        style: AppStyles.styleMedium.copyWith(
                          fontSize: 12,
                          color: AppColors.k575757,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Login",
                              style: AppStyles.styleMedium.copyWith(
                                color: AppColors.kF83758,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.kF83758,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pop();
                                }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
