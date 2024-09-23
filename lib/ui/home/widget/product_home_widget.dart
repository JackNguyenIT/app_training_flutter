import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:app_demo_flutter/resource/theme/app_style.dart';
import 'package:app_demo_flutter/ui/widget/star_rating.dart';
import 'package:flutter/material.dart';

class ProductHomeWidget extends StatelessWidget {
  const ProductHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 241,
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(AppImages.imageProductHome1, fit: BoxFit.fitWidth),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Women Printed Kurta",
                    style: AppStyles.styleMedium.copyWith(fontSize: 12),
                  ),
                  Text(
                    "Neque porro quisquam est qui dolorem ipsum quia",
                    style: AppStyles.styleRegular.copyWith(fontSize: 10),
                  ),
                  Text(
                    "\$1500",
                    style: AppStyles.styleMedium.copyWith(fontSize: 12),
                  ),
                  Row(children: [
                    Text(
                      "\$2499",
                      style: AppStyles.styleMedium.copyWith(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "50% off",
                      style: AppStyles.styleRegular.copyWith(fontSize: 10, color: Colors.red),
                    ),
                  ]),
                  Row(
                    children: [
                      const StarRating(
                        starCount: 5,
                        rating: 4.2,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "344567",
                        style: AppStyles.styleMedium.copyWith(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
