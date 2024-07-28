import 'package:blog/widget/post_card.dart';
import 'package:flutter/material.dart';

class PostGridView extends StatelessWidget {
  const PostGridView({
    super.key,
    required this.itemList,
    this.crossAxisCount = 2,
  });

  final int crossAxisCount;

  final List itemList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 440 / (176 / crossAxisCount),
      ),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return const PostCard();
      },
    );
  }
}
