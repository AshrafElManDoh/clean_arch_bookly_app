import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => BestSellerItem(),
      separatorBuilder: (context, index) => Gap(10),
      itemCount: 10,
    );
  }
}
