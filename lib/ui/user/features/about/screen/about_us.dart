import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../config/routes/router.dart';
import '../../home/component/draewr.dart';

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
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                isDrawerOpen ? Icons.close : Icons.menu,
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
          Row(
            children: [
              Text('MOHAMMED'),
              Gap(5),
              Icon(Icons.person_pin),
              Gap(5),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(24),
                  RichText(
                    text: TextSpan(
                      text: 'WELCOME TO',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          text: ' OUR CHARITY',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                        )
                      ],
                    ),
                  ),
                  const Gap(24),
                  const Image(
                    image: AssetImage(
                        Assets.imagesKrakenimagesY5bvRlcCx8kUnsplash),
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1.9),
                      'WE RE A PASSIONATE AND DEDICATED TEAM WORKING RELENTLESSLY TO MAKE APOSITIVE IMPACT IN THE WORLD. OURMISSION IS TO UPLIFT COMMUNITIE,PROVIDE ESSENTIAL RESOURCES , ANDPROMOTE EQUALITY FOR ALL. TOGETHERWE CAN CREATE POSITIVE CHANGE BYSUPPORTING THOSE IN NEED'),
                  const Gap(44.5),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 140,
                    endIndent: 140,
                  ),
                  const Gap(24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          Assets.imagesFacebook,
                        ),
                        radius: 15,
                      ),
                      Gap(12),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          Assets.imagesLinkedin,
                        ),
                        radius: 15,
                      ),
                      Gap(12),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          Assets.imagesTwitter,
                        ),
                        radius: 15,
                      ),
                    ],
                  ),
                  const Gap(42),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19),
                              side: const BorderSide(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.payment);
                        },
                        child: const Text(
                          'DONATE NOW',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
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
    );
  }
}
