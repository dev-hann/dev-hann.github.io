import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        title: Text("PostCard"),
        subtitle: Text("PostSubTitle"),
      ),
    );
  }
}
