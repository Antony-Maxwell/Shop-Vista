import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';

class TRatingandShare extends StatelessWidget {
  const TRatingandShare({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SizedBox();
        } else {
          final Products filteredProduct = state.productsList.firstWhere(
            (product) => product.id == productId,
          );
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Iconsax.star5,
                    color: Colors.yellow,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: filteredProduct.reviews == null ||
                                    filteredProduct.reviews!.isEmpty
                                ? '0'
                                : ("(${filteredProduct.reviews?.length})")
                                    .toString())
                      ],
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.share,
                size: 20,
              )
            ],
          );
        }
      },
    );
  }
}
