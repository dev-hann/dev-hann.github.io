import 'package:flutter/material.dart';

class DevBodyLayout extends StatelessWidget {
  const DevBodyLayout({
    super.key,
    this.maxWidth = 1280.0,
    this.header,
    required this.child,
  });
  final double maxWidth;
  final Widget child;
  final Widget? header;

  Widget headerWidget() {
    if (header == null) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
      ),
      child: SizedBox(
        width: 296,
        child: header,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: maxWidth,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerWidget(),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
