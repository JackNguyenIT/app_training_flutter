import 'package:flutter/material.dart';

import '../../resource/theme/app_style.dart';
import '../../router/route_page.dart';
import '../widget/star_rating.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Checkout",
            style: AppStyles.styleBold.copyWith(fontSize: 20),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.black),
                  const SizedBox(width: 8),
                  Text(
                    "Delivery Address",
                    style: AppStyles.styleBold
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(
                                  "Address:",
                                  style: AppStyles.styleMedium
                                      .copyWith(fontSize: 12),
                                ),
                                Text(
                                  "216 St Paul's Rd, London N1 2LL, UK\nContact :  +44-784232",
                                  style: AppStyles.styleRegular
                                      .copyWith(fontSize: 12),
                                )
                              ],
                            ),
                            const Positioned(
                                right: 0,
                                child: Icon(
                                  Icons.edit,
                                  size: 12,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 80,
                    height: 80,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "Shopping List",
                style: AppStyles.styleBold
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildItem();
                      },
                      separatorBuilder: (context, indext) {
                        return const SizedBox(height: 8);
                      },
                      itemCount: 20))
            ],
          ),
        )));
  }

  _buildItem() {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(SHOPPING_BAG_PAGE);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/avatar.png",
                    width: 125,
                    height: 125,
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
                      Wrap(
                        children: [
                          Text(
                            "Variations:",
                            style:
                                AppStyles.styleRegular.copyWith(fontSize: 12),
                          ),
                          const SizedBox(width: 4),
                          _buildBox("Black"),
                          const SizedBox(width: 4),
                          _buildBox("Red"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "4.8",
                            style:
                                AppStyles.styleRegular.copyWith(fontSize: 12),
                          ),
                          const SizedBox(width: 8),
                          const StarRating(
                            starCount: 5,
                            rating: 1.2,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                                border:
                                    Border.all(width: 0.5, color: Colors.grey)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              child: Text(
                                "\$ 45.00",
                                style:
                                    AppStyles.styleBold.copyWith(fontSize: 18),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                "upto 33% off",
                                style: AppStyles.styleMedium
                                    .copyWith(fontSize: 12, color: Colors.red),
                              ),
                              Text(
                                "\$ 67.00",
                                style: AppStyles.styleMedium.copyWith(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 0.5,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Order(1):",
                    style: AppStyles.styleMedium.copyWith(fontSize: 14),
                  ),
                  Text(
                    "\$ 34.00",
                    style: AppStyles.styleBold.copyWith(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildBox(String text) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          border: Border.all(width: 0.5, color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Text(
          text,
          style: AppStyles.styleRegular.copyWith(fontSize: 10),
        ),
      ),
    );
  }
}
