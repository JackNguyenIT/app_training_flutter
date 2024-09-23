import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resource/theme/app_color.dart';
import '../../resource/theme/app_style.dart';
import '../../router/route_page.dart';
import '../home/home_page.dart';
import '../wish_list/wish_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const WishListPage(),
    const WishListPage(),
    const WishListPage(),
  ];
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu, color: Colors.black),
          title: Image.asset(
            AppImages.imageLogo,
            width: 112,
            height: 32,
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          actions: [
            Image.asset(
              AppImages.imageAvatarUser,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 24)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(side: BorderSide(color: Colors.white, width: 0.0)),
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed(CHECK_OUT_PAGE);
          },
          child: SvgPicture.asset(AppImages.icShoppingCart,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: AppColors.kF9F9F9,
        body: Column(
          children: [Expanded(child: _widgetOptions[currentPage])],
        ),
        bottomNavigationBar: _buildBottomAppBar());
  }

  _buildBottomAppBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      elevation: 8.0,
      notchMargin: 10,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildItemBottomAppBar(() {
              _onItemTapped(0);
            }, AppImages.icTabHome, "Home", 0),
            _buildItemBottomAppBar(() {
              _onItemTapped(1);
            }, AppImages.icTabWishlist, "Wishlist", 1),
            const SizedBox(width: 40),
            _buildItemBottomAppBar(() {
              _onItemTapped(2);
            }, AppImages.icTabSearch, "Search", 2),
            _buildItemBottomAppBar(() {
              _onItemTapped(3);
            }, AppImages.icTabSetting, "Settings", 3)
          ],
        ),
      ),
    );
  }

  _buildItemBottomAppBar(GestureTapCallback? onTap, String? icon, String text, int position) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon ?? "",
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  (currentPage == position) ? AppColors.kF83758 : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                text,
                style: AppStyles.styleRegular.copyWith(
                  fontSize: 10,
                  color: (currentPage == position) ? AppColors.kF83758 : Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPage = index;
    });
  }
}
