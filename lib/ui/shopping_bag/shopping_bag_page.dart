import 'package:app_demo_flutter/resource/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

import '../../resource/theme/app_color.dart';
import '../../resource/theme/app_style.dart';
import '../widget/app_text_button.dart';

class ShoppingBagPage extends StatefulWidget {
  const ShoppingBagPage({super.key});

  @override
  State<ShoppingBagPage> createState() => _ShoppingBagPageState();
}

class _ShoppingBagPageState extends State<ShoppingBagPage> {
  var currentSize = 42;
  var currentQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Shopping Bag",
          style: AppStyles.styleBold.copyWith(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildInfoLayout(),
                    const SizedBox(height: 40),
                    _buildApplyCoupon(),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    ),
                    _buildOrderDetails(),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    ),
                    _buildOrderTotals(),
                  ],
                ),
              ),
            )),
            _buildLayoutBottom()
          ],
        ),
      ),
    );
  }

  _buildInfoLayout() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Image.asset(
            "assets/icons/avatar.png",
            width: 125,
            height: 153,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Women's Casual Wear",
              style: AppStyles.styleBold.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              "Checked Single-Breasted Blazer",
              style: AppStyles.styleRegular.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    _buildDialog(true);
                  },
                  child: _buildItemChoose("Size", currentSize.toString()),
                )),
                const SizedBox(width: 20),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    _buildDialog(false);
                  },
                  child: _buildItemChoose("Qty", currentQuantity.toString()),
                ))
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Delivery by",
                  style: AppStyles.styleRegular.copyWith(fontSize: 14),
                ),
                const SizedBox(width: 8),
                Text(
                  "10 May 2024",
                  style: AppStyles.styleBold.copyWith(fontSize: 14),
                ),
              ],
            )
          ],
        ))
      ],
    );
  }

  _buildItemChoose(String label, String value) {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: AppColors.kF8F8F8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          children: [
            Text(label, style: AppStyles.styleRegular),
            const SizedBox(width: 8),
            Text(value, style: AppStyles.styleMedium),
          ],
        ),
      ),
    );
  }

  _buildApplyCoupon() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Row(
        children: [
          SvgPicture.asset(AppImages.icCoupon),
          const SizedBox(width: 10),
          Text(
            "Apply Coupons",
            style: AppStyles.styleMedium.copyWith(fontSize: 16),
          ),
          const Spacer(),
          Text(
            "Select",
            style: AppStyles.styleBold.copyWith(fontSize: 13, color: Colors.red),
          ),
        ],
      ),
    );
  }

  _buildOrderDetails() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Payment Details",
            style: AppStyles.styleMedium.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Order Amounts",
                style: AppStyles.styleRegular.copyWith(fontSize: 16),
              ),
              const Spacer(),
              Text(
                "\$ 7,000.00",
                style: AppStyles.styleMedium.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Convenience",
                style: AppStyles.styleRegular.copyWith(fontSize: 16),
              ),
              const SizedBox(width: 10),
              Text(
                "Know more",
                style: AppStyles.styleBold.copyWith(fontSize: 13, color: Colors.red),
              ),
              const Spacer(),
              Text(
                "Apply Coupon",
                style: AppStyles.styleBold.copyWith(fontSize: 13, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Delivery Fee",
                style: AppStyles.styleRegular.copyWith(fontSize: 16),
              ),
              const Spacer(),
              Text(
                "Free",
                style: AppStyles.styleBold.copyWith(fontSize: 13, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildOrderTotals() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Order Total",
                style: AppStyles.styleMedium.copyWith(fontSize: 20),
              ),
              const Spacer(),
              Text(
                "\$ 7,000.00",
                style: AppStyles.styleMedium.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "EMI Available",
                style: AppStyles.styleRegular.copyWith(fontSize: 16),
              ),
              const SizedBox(width: 10),
              Text(
                "Details",
                style: AppStyles.styleBold.copyWith(fontSize: 13, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildLayoutBottom() {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.grey),
          ),
          color: AppColors.kF8F8F8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$ 7,000.00",
                  style: AppStyles.styleBold.copyWith(
                    fontSize: 14,
                  ),
                ),
                Text(
                  "View Details",
                  style: AppStyles.styleBold.copyWith(fontSize: 12, color: Colors.red),
                )
              ],
            )),
            AppTextButton(
              title: "Proceed to Payment",
              onTap: () {},
              isStretchWidth: false,
              textSize: 16,
            )
          ],
        ),
      ),
    );
  }

  _buildDialog(bool isChooseSize) {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(isChooseSize ? "Choose Size" : "Choose Quantity", style: AppStyles.styleBold),
            content: StatefulBuilder(builder: (context, sBsetState) {
              return NumberPicker(
                  selectedTextStyle: AppStyles.styleBold.copyWith(color: Colors.red),
                  textStyle: AppStyles.styleRegular,
                  value: isChooseSize ? currentSize : currentQuantity,
                  minValue: isChooseSize ? 40 : 1,
                  maxValue: isChooseSize ? 48 : 10,
                  onChanged: (value) {
                    setState(() {
                      if (isChooseSize) {
                        currentSize = value;
                      } else {
                        currentQuantity = value;
                      }
                    });
                    sBsetState(() {
                      if (isChooseSize) {
                        currentSize = value;
                      } else {
                        currentQuantity = value;
                      }
                    });
                  });
            }),
            actions: [
              TextButton(
                child: const Text("OK", style: AppStyles.styleRegular),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
