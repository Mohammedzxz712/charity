import 'package:flutter/material.dart';

class CustomSliverToBoxAdapter extends StatelessWidget {
  const CustomSliverToBoxAdapter({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: widget,
    );
  }
}
