import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_vista/application/home/products/products_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/infrastructure/profile/reviews/add_review_impl.dart';
import 'package:shop_vista/presentation/widgets/blue_button.dart';

class AddReviewContainer extends StatelessWidget {
  const AddReviewContainer({
    super.key,
    required this.product,
  });
  final Products product;

  @override
  Widget build(BuildContext context) {
    TextEditingController _descriptionController = TextEditingController();
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 450,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Text(
                      'Add Your Review',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    kHeight,
                    const CircleAvatar(
                      radius: 45,
                    ),
                    Text(
                      state.user.userName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    kHeight,
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      allowHalfRating: true,
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        );
                      },
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    TextFormField(
                      maxLines: 3,
                      controller: _descriptionController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      validator: (value) {
                        if (value == null) {
                          return 'Review cannot be null';
                        } else {
                          return null;
                        }
                      },
                    ),
                    kHeight,
                    kHeight,
                    Sign(
                      title: 'Post',
                      color: Colors.blue,
                      fontColor: Colors.white,
                      isSignUp: false,
                      onTap: () {
                        DateTime selectedDate = DateTime.now();
                        String formattedDate =
                            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                        AddReviewToFirebase().addReviewToFirebase(
                            product.id!,
                            formattedDate,
                            '3.0',
                            _descriptionController.text,
                            state.user.userName);

                        Navigator.pop(context);
                        BlocProvider.of<ProductsBloc>(context).add(const LoadProductDetails());
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
