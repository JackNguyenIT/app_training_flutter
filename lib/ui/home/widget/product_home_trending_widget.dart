import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:app_demo_flutter/resource/theme/app_style.dart';
import 'package:flutter/material.dart';

class ProductHomeTrendingWidget extends StatelessWidget {
  const ProductHomeTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 142,
      height: 186,
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(AppImages.imageProductHome2, fit: BoxFit.fitWidth),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "IWC Schaffhausen 2021 Pilot's Watch \"SIHH 2019\" 44mm",
                    style: AppStyles.styleRegular.copyWith(fontSize: 10),
                  ),
                  Text(
                    "\$650",
                    style: AppStyles.styleMedium.copyWith(fontSize: 10),
                  ),
                  Row(children: [
                    Text(
                      "\$1599",
                      style: AppStyles.styleMedium.copyWith(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "60% off",
                      style: AppStyles.styleRegular.copyWith(fontSize: 10, color: Colors.red),
                    ),
                  ]),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
