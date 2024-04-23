import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/home/cart/cart_screen.dart';
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
  final productname;
  final amount;
  final salePrice;
  final brandName;
  final attributes1;
  final attributes2;
  final attVal1;
  final attVal2;
  final description;
  final List<String> subImages;
  final String mainImage;
  final List<ProductsAttribute>? sizeVals;
  final productId;
  final stockCount;
  const ProductDetailedPage(
      {super.key,
      this.productname,
      required this.amount,
      required this.salePrice,
      required this.productId,
      this.brandName,
      this.attributes1,
      this.attributes2,
      this.attVal1,
      this.attVal2,
      required this.subImages,
      required this.mainImage,
      this.sizeVals,
      this.stockCount,
      this.description});

  final stock = "inStock";

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailedMainImage(
                  dark: dark,
                  mainImage: mainImage,
                  subImages: subImages,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TRatingandShare(),
                      const SizedBox(
                        height: 10,
                      ),
                      AmountAndDiscount(
                        salePrice: salePrice,
                        realPrice: amount,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      productName(
                        productname: productname,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StockCheck(stock: stockCount),
                      const SizedBox(
                        height: 10,
                      ),
                      BrandName(
                        brandName: brandName,
                      ),
                      kHeight,
                      Text(
                        attributes1,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TChoiceColors(
                        val1: attVal1,
                        val2: attVal2,
                      ),
                      Text(
                        attributes2,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TChoiceSize(
                        sizesList: sizeVals,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CartScreen(userId: state.user.userId!),
                              ));
                        },
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
                      Description(
                        description: description,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
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
          bottomNavigationBar: TBottomAddtoCart(
            productId: productId,
          ),
        );
      },
    );
  }
}
