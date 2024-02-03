import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  });

  String? title;
  List<Widget>? actions;
  Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!),
      actions: actions,
      leading: leading,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => preferredSize.flipped;
}
