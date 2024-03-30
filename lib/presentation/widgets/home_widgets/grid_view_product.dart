import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/product_card.dart';

class TGridViewProduct extends StatelessWidget {
  const TGridViewProduct({
  
    super.key,
    this.mainAxisExnt,
  });

  final double? mainAxisExnt;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductsBloc>(context).add(const LoadProductDetails());
    });
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: Text('Produucts are loading'),
          );
        } else if (state.hasError) {
          return Center(
            child: Text('Failed to fetch products'),
          );
        } else {
          return GridView.builder(
            itemCount: state.productsList.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final product = state.productsList[index];
              return TProductCardWidget(
                amount: product.price.toString(),
                brand: product.brand!.name.toString(),
                imageUrl: product.thumbnail.toString(),
                productName: product.title!,
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: mainAxisExnt,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
          );
        }
      },
    );
  }
}
