import 'package:clean_arch_bookly_app/core/constants/app_assets.dart';
import 'package:clean_arch_bookly_app/core/router/app_router.dart';
import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    startAppFlow();
  }

  void _initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<Offset>(
      begin: Offset(0, 3),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void startAppFlow() async {
    await Future.delayed(Duration(seconds: 2));
    GoRouter.of(context).pushReplacement(AppRouter.homeView);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(AppAssets.logo, width: 250),
          Align(
            alignment: Alignment.center,
            child: SlideTransition(
              position: animation,
              child: Text("Read Free books!", style: AppStyles.textStyle16),
            ),
          ),
        ],
      ),
    );
  }
}
