import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Best Seller", style: AppStyles.textStyle18),
              Gap(20),
              BestSellerItem(),
            ],
          );
        } else {
          return BestSellerItem();
        }
      },
      separatorBuilder: (context, index) => Gap(10),
      itemCount: 10,
    );
  }
}
