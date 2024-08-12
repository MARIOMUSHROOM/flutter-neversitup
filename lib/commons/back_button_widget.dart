import 'package:flutter/material.dart';

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.chevron_left,
      color: Colors.black,
      size: 40.0,
    );
  }
}

class BackButtonWidgetV2 extends StatelessWidget {
  const BackButtonWidgetV2({super.key, this.onPressed, this.color});
  final VoidCallback? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.transparent,
      padding: EdgeInsets.only(left: 10.0),
      child: GestureDetector(
          onTap: () async {
            if (onPressed == null) {
              Navigator.pop(context);
            } else {
              onPressed!();
            }
          },
          child: BackIconWidget()),
    );
  }
}
