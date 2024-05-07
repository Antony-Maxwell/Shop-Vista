import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/add_reviews_container.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/rating_bar.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/rating_bar_indicator.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/user_review_card.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:lottie/lottie.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Reviews & Ratings',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        showBackArrow: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
        if (state.isLoading) {
          return Container();
        } else {
          final Products filteredProduct = state.productsList.firstWhere(
            (product) => product.id == productId,
          );
          if (filteredProduct.reviews == null) {
            return Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                                height: 400,
                                width: 400,
                                child: Lottie.network(
                    "https://lottie.host/fbe7133f-fd18-4e92-95ff-40eeb477eb81/BQSlFZP9PO.json", 
                    fit: BoxFit.cover),
                              ),
                ));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Rating and Reviews are verified and are from people who use the same type of device that you use.'),
                  kHeight,
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Text(
                            '4.8',
                            style: Theme.of(context).textTheme.displayLarge,
                          )),
                      const Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              RatingBarWidget(text: '5', value: 1.0),
                              RatingBarWidget(text: '4', value: 0.8),
                              RatingBarWidget(text: '3', value: 0.6),
                              RatingBarWidget(text: '2', value: 0.4),
                              RatingBarWidget(text: '1', value: 0.2),
                            ],
                          ))
                    ],
                  ),
                  kHeight,
                  kHeight,
                  const RatingbarIndicator(
                    rating: 3.5,
                  ),
                  Text(
                    '1,291',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  kHeight,
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final review = filteredProduct.reviews![index];
                      return UserReviewCard(
                        date: review.date!,
                        description: review.description!,
                        rating: review.rating!,
                        userid: review.userId!,
                      );
                    },
                    itemCount: filteredProduct.reviews!.length,
                    separatorBuilder: (context, index) => kHeight,
                  ),
                ],
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Container();
          } else {
            final orders = state.user.orders;
            final bool isProductIdInOrders =
                orders.any((order) => order.productIds.contains(productId));

            if (isProductIdInOrders) {
              return BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  return FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              child: AddReviewContainer(
                            product: state.productsList.firstWhere(
                                (element) => element.id == productId),
                          ));
                        },
                      );
                    },
                    child: const Text('Add your review'),
                  );
                },
              );
            } else {
              return const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'You can only add a review after purchasing this product.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
