import 'package:clean_arch_bookly_app/core/constants/app_assets.dart';
import 'package:clean_arch_bookly_app/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppAssets.logo, width: 70),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.searchView);
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}
