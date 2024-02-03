import 'package:charity/config/routes/router.dart';
import 'package:charity/core/components/custome_app_bar.dart';
import 'package:charity/ui/user/features/home/component/bottom_nav.dart';
import 'package:charity/ui/user/features/home/controller/cubit.dart';
import 'package:charity/ui/user/features/home/controller/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../generated/assets.dart';
import '../component/build_cat.dart';
import '../component/draewr.dart';

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
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
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
                          imageAsset:
                              Assets.imagesPexelsKampusProduction7551662,
                          title: 'THE ELDERLY',
                          description:
                              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr. Lorem ipsum dolor sit amet, consetetur sadipscing elitr',
                        ),
                        const Gap(10),
                        // Section 3
                        BuildCategory(
                          imageAsset: Assets
                              .imagesLudemeulaFernandes9UUoGaaHtNEUnsplash,
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
                  onHomeTap: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                    setState(() {
                      isDrawerOpen = false;
                      _controller.reverse();
                    });
                  },
                  onAboutTap: () {
                    setState(() {
                      Navigator.pushNamed(context, AppRoutes.about);
                      isDrawerOpen = false;
                      _controller.reverse();
                    });
                  },
                  onSupportTap: () {
                    setState(() {
                      isDrawerOpen = false;
                      _controller.reverse();
                    });
                  },
                  onSignOutTap: () {
                    setState(() {
                      Navigator.pushNamed(context, AppRoutes.login);
                      isDrawerOpen = false;
                      _controller.reverse();
                    });
                  },
                ),
              ],
            ),
            bottomNavigationBar: const BottomNav(),
          );
        },
      ),
    );
  }
}
