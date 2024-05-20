import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class NewsLoadingItem extends StatelessWidget {
  const NewsLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SkeletonItem(
      child: Container(
        padding: const EdgeInsets.all(10),
        height: size.height * .2,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }
}
