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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    "Welcome\nBack!",
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
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(FORGOT_PASSWORD_PAGE);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: AppStyles.styleRegular.copyWith(
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 52),
                  AppTextButton(
                    title: "Login",
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
                        text: "Create An Account ",
                        style: AppStyles.styleMedium.copyWith(
                          fontSize: 12,
                          color: AppColors.k575757,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Sign Up",
                              style: AppStyles.styleMedium.copyWith(
                                color: AppColors.kF83758,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.kF83758,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamed(SIGN_UP_PAGE);
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
