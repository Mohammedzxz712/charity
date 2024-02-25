import 'package:flutter/material.dart';

import '../../../../../config/routes/app_router.dart';
import '../../../../../config/routes/routes.dart';

class BuildCategory extends StatelessWidget {
  String imageAsset;
  String title;
  String description;

  BuildCategory(
      {super.key,
      required this.imageAsset,
      required this.title,
      required this.description});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.organizationMethod),
      child: Container(
        height: 201,
        width: 373,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: AssetImage(imageAsset),
                height: 201,
                width: 373,
                fit: BoxFit.cover,
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 100,
                  width: 373,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  height: 1.2,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  description,
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 10,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   width: 90.88,
                        //   height: 29.88,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       Navigator.pushNamed(context, AppRoutes.payment);
                        //     },
                        //     style: ButtonStyle(
                        //       backgroundColor: const MaterialStatePropertyAll(
                        //         Color(0xff1DD56C),
                        //       ),
                        //       shape: MaterialStatePropertyAll(
                        //         RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(6),
                        //         ),
                        //       ),
                        //     ),
                        //     child: const Text(
                        //       'DONATE NOW',
                        //       style: TextStyle(fontSize: 8.3),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
