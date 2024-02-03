import 'package:charity/config/routes/router.dart';
import 'package:charity/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class OrganizationMethod extends StatelessWidget {
  List<String> methodName = [
    'BY MONEY',
    'BY CLOTHES',
    'BY FOOD',
    'BY BLOOD',
    'BY HOUSEWARES'
  ];
  List<String> methodImage = [
    Assets.imagesIconopenDollar,
    Assets.imagesIconmapClothingStore,
    Assets.imagesIconmapFood,
    Assets.imagesIconmetroInjection,
    Assets.imagesWashingMachineSvgrepoCom,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(18),
                RichText(
                  text: TextSpan(
                    text: 'CHAR',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(
                        text: 'ITY',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                      )
                    ],
                  ),
                ),
                const Gap(10),
                const Text('DONATE METHOD',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                const Gap(20),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two containers per row
                    crossAxisSpacing:
                        10.0, // Spacing between containers horizontally
                    mainAxisSpacing:
                        10.0, // Spacing between containers vertically
                  ),
                  itemCount: 5, // Total number of containers
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.payment),
                      child: Container(
                        width: 170,
                        height: 170,
                        color: const Color(
                            0xffEFF9F4), // You can customize the color or other properties
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xffF1F1F1),
                                radius: 55,
                                child: SvgPicture.asset(
                                  methodImage[index],
                                  // width: 26.13,
                                  // height: 21.25,
                                ),
                              ),
                              Text(
                                methodName[index],
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
