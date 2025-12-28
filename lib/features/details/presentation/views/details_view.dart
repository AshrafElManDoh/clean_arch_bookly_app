import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/details_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const DetailsBody(),
      ),
    );
  }
}