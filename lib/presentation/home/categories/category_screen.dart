import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/categories/bloc/categories_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/categories/widgets/category_bloc_card.dart';
import 'package:shop_vista/presentation/home/categories/widgets/category_product.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/rounded_image.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';
import 'package:shop_vista/presentation/widgets/section_heading/section_heading.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {Key? key, required this.categoryName, required this.imageUrl, required this.parentId})
      : super(key: key);

  final String categoryName;
  final String imageUrl;
  final String parentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TRoundedImage(
                width: double.infinity,
                height: 250,
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const TSectionHeading(title: 'Sub Products'),
              const SizedBox(height: 10),
              CategoryBloCCard(parentId: parentId),
            ],
          ),
        ),
      ),
    );
  }
}
