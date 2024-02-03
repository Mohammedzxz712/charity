import 'package:charity/config/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomMainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomMainAppBar({
    Key? key,
    required this.isDrawerOpen,
    required this.onDrawerIconTap,
  }) : super(key: key);

  final bool isDrawerOpen;
  final VoidCallback onDrawerIconTap;

  @override
  State<CustomMainAppBar> createState() => _CustomMainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomMainAppBarState extends State<CustomMainAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(
          widget.isDrawerOpen ? Icons.close : Icons.menu,
        ),
        onPressed: () {
          widget.onDrawerIconTap();
        },
      ),
      actions: [
        InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
          child: const Row(
            children: [
              Text('MOHAMMED'),
              Gap(5),
              Icon(Icons.person_pin),
              Gap(5),
            ],
          ),
        )
      ],
    );
  }
}
