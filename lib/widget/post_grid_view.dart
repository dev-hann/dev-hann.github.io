import 'package:blog/model/post.dart';
import 'package:blog/widget/post_card.dart';
import 'package:flutter/material.dart';

class PostGridView extends StatelessWidget {
  const PostGridView({
    super.key,
    required this.itemList,
    required this.onItemTap,
    this.crossAxisCount = 2,
  });

  final int crossAxisCount;
  final List<Post> itemList;
  final Function(Post item) onItemTap;
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
        final item = itemList[index];
        return InkWell(
          onTap: () {
            onItemTap(item);
          },
          child: PostCard(
            post: item,
          ),
        );
      },
    );
  }
}
