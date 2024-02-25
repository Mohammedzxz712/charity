import 'package:charity/core/helpers/exetinsions.dart';
import 'package:charity/ui/user/features/home/component/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/widgets/custome_app_bar.dart';
import '../../../../../generated/assets.dart';
import '../component/build_cat.dart';
import '../component/drawer.dart';
import '../logic/cubit.dart';
import '../logic/states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomMainAppBar(
            isDrawerOpen: isDrawerOpen,
            onDrawerIconTap: () {
              setState(() {
                isDrawerOpen = !isDrawerOpen;
                if (isDrawerOpen) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              });
            },
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'HELP OUR INSTITUTIONS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      const Gap(5),
                      const Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr Lorem ipsum \ndolor sit amet, consetetur sadipscing elitr',
                        style: TextStyle(color: Colors.grey, height: 1.2),
                      ),
                      const Gap(5),
                      // Section 1
                      BuildCategory(
                        imageAsset: Assets.imagesPexelsSporaWeddings18992280,
                        title: 'ORPHANS',
                        description:
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr. Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                      ),
                      const Gap(10),
                      // Section 2
                      BuildCategory(
                        imageAsset: Assets.imagesPexelsKampusProduction7551662,
                        title: 'THE ELDERLY',
                        description:
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr. Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                      ),
                      const Gap(10),
                      // Section 3
                      BuildCategory(
                        imageAsset:
                            Assets.imagesLudemeulaFernandes9UUoGaaHtNEUnsplash,
                        title: 'ANIMALS',
                        description:
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr. Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                      ),
                    ],
                  ),
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
          bottomNavigationBar: const BottomNav(),
        );
      },
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
