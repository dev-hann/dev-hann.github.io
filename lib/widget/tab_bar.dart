import 'package:flutter/material.dart';

class DevTabBar extends StatelessWidget {
  const DevTabBar({
    super.key,
    required this.controller,
    required this.onTap,
    required this.tabList,
  });
  final TabController controller;
  final List<DevTab> tabList;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      onTap: onTap,
      tabs: tabList,
    );
  }
}

class DevTab extends StatelessWidget {
  const DevTab({
    super.key,
    required this.icon,
    required this.text,
    this.count,
  });
  final Widget icon;
  final String text;
  final int? count;

  Widget counterTextWidget() {
    if (count == null) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
      ),
      child: Text("$count"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 8.0),
        Text(text),
        counterTextWidget(),
      ],
    );
  }
}
