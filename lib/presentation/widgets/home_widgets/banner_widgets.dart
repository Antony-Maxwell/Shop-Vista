import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TBannerWidget extends StatelessWidget {
  const TBannerWidget({
    super.key,
    this.imageUrl,
  });
  final imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
        BoxShadow(
          color: Colors.grey.shade300,
          offset: const Offset(-5, 0),
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          key: UniqueKey(),
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
