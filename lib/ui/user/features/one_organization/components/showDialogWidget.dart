import 'package:charity/core/widgets/progress_indector.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/app_colors.dart';

class ShowDialogWidget extends StatelessWidget {
  const ShowDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return FutureBuilder<void>(
          future: Future.delayed(Duration.zero),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            ColorsManager.semiGray), // Semi-gray color
                      ),
                    ),
                  );
                },
              );
              return SizedBox
                  .shrink(); // Placeholder widget since showDialog returns void
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsManager.semiGray), // Semi-gray color
                ),
              );
            }
          },
        );
      },
    );
  }
}
