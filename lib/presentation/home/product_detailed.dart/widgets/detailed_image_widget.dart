import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/curved_widget.dart';
import 'package:shop_vista/presentation/widgets/home_widgets/rounded_image.dart';

class DetailedMainImage extends StatelessWidget {
  const DetailedMainImage({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? Colors.grey : Colors.white,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                    child:
                        Image(image: AssetImage("assets/products/shoes4.jpg"))),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return TRoundedImage(
                          width: 80,
                          backGroundColor:
                              dark ? Colors.grey.shade600 : Colors.white,
                          border: Border.all(color: Colors.grey),
                          padding: EdgeInsets.all(10),
                          imageUrl: "assets/products/shoes4.jpg");
                    },
                    separatorBuilder: (_, __) => SizedBox(
                          width: 10,
                        ),
                    itemCount: 4),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              action: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
