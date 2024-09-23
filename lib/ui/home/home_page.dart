import 'package:app_demo_flutter/data/dummy_data.dart';
import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:app_demo_flutter/resource/theme/app_color.dart';
import 'package:app_demo_flutter/ui/home/widget/product_home_trending_widget.dart';
import 'package:app_demo_flutter/ui/home/widget/product_home_widget.dart';
import 'package:app_demo_flutter/ui/home/widget/sale_off_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resource/theme/app_style.dart';
import '../widget/search_form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchFormWidget(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  Icons.mic,
                  color: Colors.grey,
                ),
                textHint: "Search any Product",
              ),
              _buildFilter(),
              _buildListCategory(),
              const SizedBox(height: 10),
              const SaleOffSliderWidget(),
              const SizedBox(height: 10),
              _buildDealOfDay(),
              const SizedBox(height: 10),
              _buildListProductHome(),
              const SizedBox(height: 10),
              _buildHomeSpecial(),
              const SizedBox(height: 10),
              _buildTrendingProduct(),
              const SizedBox(height: 10),
              _buildListProductTrendingHome()
            ],
          ),
        ),
      ),
    );
  }

  _buildFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "All Featured",
            style: AppStyles.styleBold.copyWith(fontSize: 16),
          ),
          const Spacer(),
          _buildItemFilter("Sort", AppImages.icSort),
          const SizedBox(width: 10),
          _buildItemFilter("Filter", AppImages.icFilter),
        ],
      ),
    );
  }

  _buildListCategory() {
    final list = DummyData.categories;
    return SizedBox(
      width: double.maxFinite,
      height: 100,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = list[index];
              return SizedBox(
                height: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        item.url,
                        height: 56,
                        width: 56,
                      ),
                      const SizedBox(height: 4),
                      Text(item.name, style: AppStyles.styleRegular),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
            itemCount: list.length),
      ),
    );
  }

  _buildItemFilter(String text, String icon) {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6)), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            Text(text, style: AppStyles.styleRegular),
            const SizedBox(width: 8),
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
            )
          ],
        ),
      ),
    );
  }

  _buildDealOfDay() {
    return Card(
      color: AppColors.k4392F9,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deal of the Day",
                    style: AppStyles.styleMedium.copyWith(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.icClock,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "22h 55m 20s remaining ",
                        style: AppStyles.styleRegular.copyWith(fontSize: 12, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(children: [
                  Text(
                    "View all",
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
    );
  }

  _buildListProductHome() {
    return SizedBox(
      width: double.infinity,
      height: 241,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const ProductHomeWidget();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 12);
          },
          itemCount: 20),
    );
  }

  _buildHomeSpecial() {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Image.asset(AppImages.imageHomeSpecial),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Special Offers",
                    style: AppStyles.styleMedium.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "We make sure you get the offer you need at best prices",
                    style: AppStyles.styleRegular.copyWith(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTrendingProduct() {
    return Card(
      color: AppColors.kFD6E87,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trending Products",
                    style: AppStyles.styleMedium.copyWith(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.icCalendar,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Last Date 29/02/22",
                        style: AppStyles.styleRegular.copyWith(fontSize: 12, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(children: [
                  Text(
                    "View all",
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
    );
  }

  _buildListProductTrendingHome() {
    return SizedBox(
      width: double.infinity,
      height: 186,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const ProductHomeTrendingWidget();
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 12);
          },
          itemCount: 20),
    );
  }
}
