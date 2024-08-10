import 'package:blog/widget/body_layout.dart';
import 'package:blog/widget/post_grid_view.dart';
import 'package:flutter/material.dart';

class RepositoryView extends StatelessWidget {
  const RepositoryView({
    super.key,
  });

  Widget tagListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("TagList"),
        const Divider(),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(5, (index) {
            return Chip(
              label: Text("$index"),
            );
          }),
        ),
      ],
    );
  }

  Widget searchTextField() {
    return Row(
      children: [
        const Expanded(
          child: TextField(),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Search"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DevBodyLayout(
      header: tagListView(),
      child: Column(
        children: [
          searchTextField(),
          const SizedBox(height: 16.0),
          PostGridView(
            crossAxisCount: 1,
            itemList: List.generate(10, (index) {
              return index;
            }),
          ),
        ],
      ),
    );
  }
}
