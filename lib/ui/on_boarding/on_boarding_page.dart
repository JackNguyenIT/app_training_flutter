import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:app_demo_flutter/resource/theme/app_color.dart';
import 'package:app_demo_flutter/resource/theme/app_style.dart';
import 'package:app_demo_flutter/router/route_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var currentPage = 0;
  var pageSize = 3;

  final PageController _pageController = PageController();

  void _nextPage() {
    if (currentPage >= (pageSize - 1)) {
      Navigator.of(context).pushNamed(LOGIN_PAGE);
      return;
    }
    setState(() {
      currentPage++;
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  void _backPage() {
    if (currentPage == 0) {
      return;
    }
    setState(() {
      currentPage--;
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              _buildTopInfo(),
              Expanded(
                  child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  _buildPage(AppImages.imageOnBoarding1, "Choose Products"),
                  _buildPage(AppImages.imageOnBoarding2, "Make Payment"),
                  _buildPage(AppImages.imageOnBoarding3, "Get Your Order"),
                ],
              )),
              _buildBottomInfo(),
            ],
          ),
        ));
  }

  _buildPage(String image, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ))),
          Expanded(
              child: Column(
            children: [
              Text(
                title,
                style: AppStyles.styleBold.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
                style: AppStyles.styleRegular.copyWith(fontSize: 14, color: AppColors.kA8A8A9),
                textAlign: TextAlign.center,
              )
            ],
          ))
        ],
      ),
    );
  }

  _buildTopInfo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              text: "${currentPage + 1}",
              style: AppStyles.styleBold.copyWith(
                fontSize: 16,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "/$pageSize",
                  style: AppStyles.styleBold.copyWith(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(LOGIN_PAGE);
            },
            child: Text(
              "Skip",
              style: AppStyles.styleBold.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              _backPage();
            },
            child: Text(
              "Prev",
              style: AppStyles.styleMedium.copyWith(fontSize: 16, color: Colors.grey),
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController, // PageController
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.k17223B,
                  dotColor: AppColors.k17223B.withOpacity(0.2),
                  spacing: 6,
                  dotHeight: 10,
                  dotWidth: 10,
                  radius: 10,
                  expansionFactor: 4), // your preferred effect
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                _nextPage();
              },
              child: Text(
                "Next",
                style: AppStyles.styleMedium.copyWith(fontSize: 16, color: AppColors.kF83758),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
