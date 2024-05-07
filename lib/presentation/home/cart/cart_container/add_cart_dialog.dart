import 'package:flutter/material.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/domain/home/products/model/products.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/add_to_cart.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/choice_chip_color.dart';
import 'package:shop_vista/presentation/home/product_detailed.dart/widgets/choicechips_colors.dart';

class AddCartDialogue extends StatelessWidget {
  const AddCartDialogue({super.key, this.sizeVals, this.attVal1, this.attVal2, required this.productName, required this.productId});

  final List<ProductsAttribute>? sizeVals;
  final attVal1;
  final attVal2;
  final String productName;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Cart'),
      content: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset("assets/cart-removebg-preview.png", fit: BoxFit.cover,),
            ),
            Text(productName, style: const TextStyle(fontSize: 18),),
            const Divider(),
            const Text('Select your prefered color'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 50,),
                TChoiceColors(
                  val1: attVal1,
                  val2: attVal2,
                ),
              ],
            ),
            const Text('Select your prefered size'),
            TChoiceSize(
              sizesList: sizeVals,
            ),
            kHeight,
            TBottomAddtoCart(isDialog: true, productId: productId, height: 40, width: 40, isCart: false, iconSize: 15, padding: 10)
          ],
        ),
      ),
      actions: <Widget>[
        Center(
          child: TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue)
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('close', style: TextStyle(
              color: Colors.white,
            ),),
          ),
        ),
      ],
    );
  }
}
