import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/cart/cart_container/add_cart_dialog.dart';

class TProductDetails extends StatelessWidget {
  const TProductDetails({
    super.key,
    required this.productName,
    required this.brand,
    required this.amount,
    this.sizeVals,
    this.attVal1,
    this.attVal2, required this.productId,
  });

  final String productName;
  final String brand;
  final amount;
  final List<ProductsAttribute>? sizeVals;
  final attVal1;
  final attVal2;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              productName,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              brand,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Iconsax.verify5,
              color: Colors.blue,
              size: 15,
            )
          ],
        ),
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
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddCartDialogue(
                      productId: productId,
                      productName: productName,
                      sizeVals: sizeVals,
                      attVal1: attVal1,
                      attVal2: attVal2,
                    );
                  },
                );
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(15),
                    )),
                child: const Icon(
                  Iconsax.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
