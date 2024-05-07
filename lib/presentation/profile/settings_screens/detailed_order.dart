import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/profile/address_selection/address_selection_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/User/user_model/user_model.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/profile/widgets/detailed_order_container.dart';
import 'package:shop_vista/presentation/profile/widgets/order_container.dart';
import 'package:shop_vista/presentation/profile/widgets/order_details.dart';
import 'package:shop_vista/presentation/profile/widgets/order_summary.dart';
import 'package:shop_vista/presentation/profile/widgets/shipping_address.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/blue_button.dart';
import 'package:shop_vista/presentation/widgets/product_cart/shimmer.dart';
import 'package:shop_vista/presentation/widgets/section_heading/section_heading.dart';

class DetailedOrderScreen extends StatelessWidget {
  const DetailedOrderScreen({super.key, required this.order});

  final Orders order;

  @override
  Widget build(BuildContext context) {
    final address = order.address;
    final color;
    if (order.status == 'Shipped') {
      color = const Color.fromARGB(255, 255, 213, 59);
    } else if (order.status == 'Delivered') {
      color = Colors.green;
    } else {
      color = Colors.orange;
    }
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Detailed View',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, productState) {
              if (productState.isLoading) {
                return ShimmerProduct().buildShimmerEffectCategory();
              }
              final List<Products> orderedProducts =
                  productState.productsList.where((product) {
                // Check if any product in the order matches the product's ID
                return order.productIds
                    .any((orderedItem) => orderedItem == product.id);
              }).toList();
              print(orderedProducts);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderContainer(order: order),
                  kHeight,
                  OrderDetails(order: order),
                  kHeight,
                  const Text('Product Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  kHeight,
                  DetailedOrderContainer(orderedProducts: orderedProducts),
                  kHeight,
                  kHeight,
                  const TSectionHeading(
                    title: 'Order Status',
                    showActionButton: false,
                  ),
                  kHeight,
                  Sign(
                    title: order.status,
                    color: color,
                    fontColor: Colors.white,
                    isSignUp: false,
                  ),
                  kHeight,
                  kHeight,
                  ShippingAddressContainer(address: address),
                  kHeight,
                  kHeight,
                  OrderSummaryContainer(order: order)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
