import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:app_demo_flutter/resource/theme/app_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SaleOffSliderWidget extends StatelessWidget {
  const SaleOffSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: CarouselSlider(
            items: [
              _buildItem(context: context),
              _buildItem(context: context),
              _buildItem(context: context),
            ],
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              onPageChanged: (index, _) {},
            ),
          ),
        ),
        const SizedBox(height: 10),
        const AnimatedSmoothIndicator(
          activeIndex: 1,
          count: 3,
          effect: ScrollingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotScale: 1.5,
            activeStrokeWidth: 1,
            maxVisibleDots: 7,
            fixedCenter: true,
          ),
        )
      ],
    );
  }

  Widget _buildItem({
    required BuildContext context,
  }) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              AppImages.imageProductSaleOff,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 0,
            left: 20,
            bottom: 0,
            child: SizedBox(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "50-40% OFF",
                    style: AppStyles.styleBold.copyWith(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "Now in (product)\nAll colours",
                    style: AppStyles.styleRegular.copyWith(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(width: 1, color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Row(children: [
                        Text(
                          "Shop Now",
                          style: AppStyles.styleBold.copyWith(fontSize: 12, color: Colors.white),
                        ),
                        const SizedBox(width: 6),
                        SvgPicture.asset(
                          AppImages.icArrowRight,
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
