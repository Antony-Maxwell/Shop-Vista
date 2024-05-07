
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/categories/widgets/category_product.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/detailed_product.dart';
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
                ontap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailedPage(amount: filteredProducts[index].price, salePrice: filteredProducts[index].salePrice, productId: filteredProducts[index].id, subImages: filteredProducts[index].images!, mainImage: filteredProducts[index].thumbnail!, attVal1: filteredProducts[index].productsAttributes![0].values![0].toString(), attVal2: filteredProducts[index].productsAttributes![0].values![1].toString() , attributes1: filteredProducts[index].productsAttributes![0].name, attributes2: filteredProducts[index].productsAttributes![1].name, brandName: filteredProducts[index].brand!.name, description: filteredProducts[index].description, productname: filteredProducts[index].title, sizeVals: filteredProducts[index].productsAttributes, stockCount: filteredProducts[index].stock),)),
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
