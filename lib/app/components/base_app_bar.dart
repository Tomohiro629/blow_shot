import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar(
      {super.key,
      required this.title,
      required this.widgets,
      required this.color});
  final Text title;
  final List<Widget> widgets;
  final Color color;
  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      title: title,
      actions: widgets,
      centerTitle: true,
      backgroundColor: color,
      elevation: 10,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
