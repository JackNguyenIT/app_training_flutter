import 'package:app_demo_flutter/router/route_page.dart';
import 'package:app_demo_flutter/ui/forgot_password/forgot_password_page.dart';
import 'package:app_demo_flutter/ui/on_boarding/on_boarding_page.dart';
import 'package:app_demo_flutter/ui/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../ui/checkout/checkout_page.dart';
import '../ui/login/login_page.dart';
import '../ui/main/main_page.dart';
import '../ui/shopping_bag/shopping_bag_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // get argument bundle that was attached
    final arguments = settings.arguments;

    // use switch case to determine the requested route.
    switch (settings.name) {
      case ON_BOARDING_PAGE:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
          settings: settings,
        );
      case LOGIN_PAGE:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case FORGOT_PASSWORD_PAGE:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordPage(),
          settings: settings,
        );
      case SIGN_UP_PAGE:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
          settings: settings,
        );
      case MAIN_PAGE:
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
          settings: settings,
        );
      case CHECK_OUT_PAGE:
        return MaterialPageRoute(
          builder: (_) => const CheckOutPage(),
          settings: settings,
        );
      case SHOPPING_BAG_PAGE:
        return MaterialPageRoute(
          builder: (_) => const ShoppingBagPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
          settings: settings,
        );
    }
  }
}
