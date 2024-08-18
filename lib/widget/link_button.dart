import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    this.onTap,
    this.style,
    required this.text,
  });
  final VoidCallback? onTap;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> hoverNotifier = ValueNotifier(false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        hoverNotifier.value = true;
      },
      onExit: (event) {
        hoverNotifier.value = false;
      },
      child: GestureDetector(
        onTap: onTap,
        child: ValueListenableBuilder<bool>(
          valueListenable: hoverNotifier,
          builder: (context, isHover, _) {
            return Text(
              text,
              style: style?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: isHover ? TextDecoration.underline : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
