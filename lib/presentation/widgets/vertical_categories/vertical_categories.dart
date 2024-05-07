import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_vista/helpers/helper.dart';

class TVerticalCategories extends StatelessWidget {
  const TVerticalCategories({
    super.key,
    this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backGroundColor,
    this.ontap,
  });

  final String? image, title;
  final Color textColor;
  final Color? backGroundColor;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color:
                      backGroundColor ?? (dark ? Colors.black : Colors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(imageUrl: image!, fit: BoxFit.cover,)),
            ),
            SizedBox(
              width: 55,
              child: Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
