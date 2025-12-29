import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.votes});
  final String rating;
  final String votes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.amberAccent),
        Gap(3),
        Text(rating, style: AppStyles.textStyle16),
        Gap(3),
        Text(
          "($votes)",
          style: AppStyles.textStyle16.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
