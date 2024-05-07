
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/helpers/helper.dart';

class DetailedOrderContainer extends StatelessWidget {
  const DetailedOrderContainer({
    super.key,
    required this.orderedProducts,
  });

  final List<Products> orderedProducts;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => kHeight,
        itemCount: orderedProducts.length,
        itemBuilder: (context, index) {
          final product = orderedProducts[index];
          return Container(
            height: 150,
            width: double.infinity,
            decoration: dark
            ?
            BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)
            )
            :
            BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        product.title!,
                        style: TextStyle(fontSize: 18),
                      ),
                      kHeight,
                      Text(
                        '\$${product.salePrice}',
                      ),
                      kHeight,
                      Row(
                        children: [
                          Text(
                            product.brand!.name!,
                          ),
                          const SizedBox(width: 5,),
                          const Icon(Icons.verified, color: Colors.blue, size: 15,),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: 120,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: product.thumbnail!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: const SizedBox(
                            height: 120,
                            width: 110,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
