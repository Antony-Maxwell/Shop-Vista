import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/detailed_product.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/discount_container.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/fav_icon.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/product_basic_details.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/rounded_image.dart';
import 'package:shop_vista/utils/theme/product_shadow/product_shadow.dart';

class TProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final amount;
  final String brand;
  final String productName;
  final salePrice;
  final attributes1;
  final attributes2;
  final List<ProductsAttribute>? attVals;
  final List<String> subImages;
  final String mainImage;
  final description;
  final productId;
  final Color? iconColor;
  final stockCount;
  const TProductCardWidget({
    Key? key,
    this.stockCount,
    this.iconColor,
    required this.imageUrl,
    required this.amount,
    required this.brand,
    required this.productName,
    required this.salePrice,
    this.attributes1,
    this.attributes2,
    required this.subImages,
    required this.mainImage,
    required this.attVals,
    this.description,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(amount);
    print(salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<UserBloc,UserState>(
      builder: (context, state) {
        return  GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ProductDetailedPage(
              productId: productId,
              mainImage: mainImage,
              subImages: subImages,
              amount: amount,
              brandName: brand,
              productname: productName,
              salePrice: salePrice,
              attributes1: attributes1,
              attributes2: attributes2,
              sizeVals: attVals,
              attVal1: attVals![0].values![0].toString(),
              attVal2: attVals![0].values![1].toString(),
              description: description,
              stockCount: stockCount,
            );
          },
        )),
        child: Container(
          width: 180,
          // padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(16),
            color: dark ? Colors.grey : const Color.fromARGB(255, 238, 236, 236),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    // Product image
                    TRoundedImage( width: double.infinity,  height:  177,isNetworkImage: true, imageUrl: imageUrl),
                    TDiscountContainer(
                      ogPrice: amount,
                      salePrice:salePrice,
                    ),
                    TFavIcon(
                      iconColortemp: iconColor!,
                      userId: state.user.userId!,
                      productId: productId,
                    )
                  ],
                ),
                const SizedBox(
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
    );
  }
}
