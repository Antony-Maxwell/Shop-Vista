import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TProductCardShimmer extends StatelessWidget {
  const TProductCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: const Center(child: Icon(Icons.refresh)),
              ),
            );
          }),
    );
  }
}
