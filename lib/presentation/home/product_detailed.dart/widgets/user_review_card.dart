import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/rating_bar_indicator.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.userid, required this.description, required this.date, required this.rating});

  final String userid;
  final String description;
  final String date;
  final String rating;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20,),
                const SizedBox(width: 10,),
                Text(userid, style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        kHeight,
        Row(
          children: [
            RatingbarIndicator(rating: double.parse(rating)),
            const SizedBox(width: 10,),
            Text(date, style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        kHeight,
        ReadMoreText(
          description,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
        )
      ],
    );
  }
}