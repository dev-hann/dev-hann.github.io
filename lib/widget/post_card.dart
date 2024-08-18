import 'package:blog/model/post.dart';
import 'package:blog/widget/link_button.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.onTap,
    required this.post,
  });
  final VoidCallback onTap;
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinkButton(
              onTap: onTap,
              text: post.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            Text(
              post.author.dateTime.toString(),
            )
          ],
        ),
      ),
    );
  }
}
