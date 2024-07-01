import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../config/routes/routes.dart';

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
  Size get preferredSize => Size.fromHeight(56.0.h);
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
          color: Colors.white,
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
              Text('..Mohammed Ali', style: TextStyle(color: Colors.white)),
              Gap(5),
              Icon(
                Icons.person_pin,
                color: Colors.white,
              ),
              Gap(5),
            ],
          ),
        )
      ],
    );
  }
}
