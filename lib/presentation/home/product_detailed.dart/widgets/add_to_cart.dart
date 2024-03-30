import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/helpers/helper.dart';

class TBottomAddtoCart extends StatelessWidget {
  const TBottomAddtoCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: dark ? Colors.grey : Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: Icon(Icons.remove)),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '2',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: Icon(
                Icons.add,
                color: Colors.white,
              )),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Wrap(
                children: [
                  Icon(Iconsax.shopping_bag),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Add to bag',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
