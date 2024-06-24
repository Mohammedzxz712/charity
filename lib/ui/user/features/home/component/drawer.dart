import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  final bool isDrawerOpen;
  final AnimationController controller;
  final VoidCallback onHomeTap;
  final VoidCallback onSupportTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSignOutTap;

  const CustomDrawer({
    Key? key,
    required this.isDrawerOpen,
    required this.controller,
    required this.onHomeTap,
    required this.onSupportTap,
    required this.onAboutTap,
    required this.onSignOutTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      right: isDrawerOpen ? 0 : -MediaQuery.of(context).size.width,
      child: buildDrawerContent(context),
    );
  }

  Widget buildDrawerContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.2,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        border: Border.all(color: Colors.grey),
        borderRadius:  BorderRadius.only(
          topRight: Radius.circular(20.0.r),
          bottomRight: Radius.circular(20.0.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDrawerItem(
              context, AppLocalizations.of(context)!.home, onHomeTap),
          buildDrawerItem(
              context, AppLocalizations.of(context)!.about, onAboutTap),
          buildDrawerItem(
              context, AppLocalizations.of(context)!.support, onSupportTap),
          buildDrawerItem(
              context, AppLocalizations.of(context)!.signout, onSignOutTap),
          // Add other drawer items using buildDrawerItem function
        ],
      ),
    );
  }

  Widget buildDrawerItem(
      BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
