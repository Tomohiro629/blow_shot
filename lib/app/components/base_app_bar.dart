import 'package:blow_shot/app/components/logout_dialog.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({super.key, required this.title, required this.color});
  final Text title;

  final Color color;
  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => const LogoutDialog());
              },
              icon: const Icon(Icons.logout_outlined)),
        )
      ],
      centerTitle: true,
      backgroundColor: color,
      elevation: 10,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
