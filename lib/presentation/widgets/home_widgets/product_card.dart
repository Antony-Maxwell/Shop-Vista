import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/detailed_product.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/discount_container.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/fav_icon.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/product_basic_details.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/rounded_image.dart';
import 'package:shop_vista/utils/theme/product_shadow/product_shadow.dart';

class TProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String amount;
  final String brand;
  final String productName;
  const TProductCardWidget({
    Key? key,
    required this.imageUrl,
    required this.amount,
    required this.brand,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return ProductDetailedPage();
        },
      )),
      child: Container(
        width: 180,
        // padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(16),
          color: dark ? Colors.grey : Color.fromARGB(255, 238, 236, 236),
        ),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Column(
            children: [
              Stack(
                children: [
                  // Product image
                  TRoundedImage( isNetworkImage: true,imageUrl:imageUrl),
                  TDiscountContainer(),
                  TFavIcon(),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              TProductDetails(
                amount: amount,
                brand: brand,
                productName: productName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
