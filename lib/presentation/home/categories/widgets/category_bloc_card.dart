
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/categories/widgets/category_product.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';

class CategoryBloCCard extends StatelessWidget {
  const CategoryBloCCard({
    super.key,
    required this.parentId,
  });

  final String parentId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, productState) {
        if(productState.isLoading){
          return ShimmerProduct().buildShimmerEffectCategory();
        }else{
          final List<Products> filteredProducts = productState.productsList.where((product) => product.categoryId == parentId).toList();
        return SizedBox(
          height: 160,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            shrinkWrap: true,
            itemCount: filteredProducts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryProductCard(
                description: filteredProducts[index].description!,
                productName: filteredProducts[index].title!,
                brand: filteredProducts[index].brand!.name!,
                amount: filteredProducts[index].price,
                imageUrl: filteredProducts[index].thumbnail!,
              );
            },
          ),
        );
        }
      },
    );
  }
}
