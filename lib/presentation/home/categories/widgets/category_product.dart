
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/helpers/helper.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/discount_container.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/rounded_image.dart';

class CategoryProductCard extends StatelessWidget{
  const CategoryProductCard({super.key, required this.productName, required this.brand, this.amount, required this.imageUrl, required this.description, required this.ontap});

  final String productName;
  final String brand;
  final double? amount;
  final String imageUrl;
  final String description;
  final VoidCallback ontap;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 165,
      width: 380,
      decoration: dark
      ?
      BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20)
      )
      :
      BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              children: [
                TRoundedImage(
                  fit: BoxFit.cover,
                  width: 170,
                  height: 140,
                  imageUrl: imageUrl,
                ),
                const Positioned(
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TDiscountContainer(ogPrice: 110.0, salePrice: 100.0),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 2), // Added spacing
                  Text(description,
                    maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        brand,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Iconsax.verify5,
                        color: Colors.blue,
                        size: 15,
                      )
                    ],
                  ),
                  const SizedBox(height: 30), // Added spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ $amount',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: const Icon(
                          Iconsax.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
}