import 'package:flutter/material.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/add_to_cart.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/amount.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/brand_name.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/choice_chip_color.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/choicechips_colors.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/description.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/detailed_image_widget.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/product_name.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/rating_and_share.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/stock_check.dart';

class ProductDetailedPage extends StatelessWidget {
  ProductDetailedPage({super.key});

  final stock = "inStock";

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailedMainImage(dark: dark),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TRatingandShare(),
                  const SizedBox(
                    height: 10,
                  ),
                  const AmountAndDiscount(),
                  const SizedBox(
                    height: 10,
                  ),
                  const productName(
                    productname: 'Nike Air Sports shoes White and Blur',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StockCheck(stock: stock),
                  const SizedBox(
                    height: 10,
                  ),
                  const BrandName(
                    brandName: 'NIKE',
                  ),
                  kHeight,
                  Text(
                    'Colors',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TChoiceColors(),
                  Text(
                    'Size',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const TChoiceSize(),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1.1, 1.1),
                                blurRadius: 5.0,
                                spreadRadius: 1.0)
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      width: double.infinity,
                      height: 50,
                      child: const Center(
                        child: Text(
                          'CheckOut',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Description',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  const Description(),
                  const Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reviews  (199)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TBottomAddtoCart(),
    );
  }
}
