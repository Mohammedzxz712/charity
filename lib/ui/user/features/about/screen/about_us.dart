import 'package:charity/config/colors/app_colors.dart';
import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/core/helpers/spacing.dart';
import 'package:charity/ui/user/features/about/components/donate_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/routes/routes.dart';
import '../../home/component/drawer.dart';
import '../components/action_appBar.dart';
import '../components/social_row.dart';
import '../components/welcome_and_image_and_text_and_divider.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isDrawerOpen = false;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                isDrawerOpen ? Icons.close : Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isDrawerOpen = !isDrawerOpen;
                  if (isDrawerOpen) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                });
              },
            );
          },
        ),
        actions: const [
          ActionAppBar(),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const WelcomeAndImageAndTextAndDivider(),
                const SocialRow(),
                verticalSpace(20.h),
                const DonateBottom(),
              ],
            ),
          ),
          CustomDrawer(
            isDrawerOpen: isDrawerOpen,
            controller: _controller,
            onHomeTap: () => _navigateAndCloseDrawer(AppRoutes.home),
            onAboutTap: () => _navigateAndCloseDrawer(AppRoutes.about),
            onSupportTap: () => _navigateAndCloseDrawer(AppRoutes.support),
            onSignOutTap: () => _navigateAndCloseDrawer(AppRoutes.login),
          ),
        ],
      ),
    );
  }

  void _navigateAndCloseDrawer(String routeName) {
    context.pushNamed(routeName);
    setState(() {
      isDrawerOpen = false;
      _controller.reverse();
    });
  }
}
