import 'package:charity/core/widgets/progress_indector.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/app_colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Center(child: CustomLoadingIndicator()),
    );
  }
}
