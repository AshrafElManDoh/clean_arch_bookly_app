import 'package:clean_arch_bookly_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppAssets.logo, width: 70),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }
}
