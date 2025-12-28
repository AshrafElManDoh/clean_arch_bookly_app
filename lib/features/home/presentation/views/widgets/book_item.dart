import 'package:clean_arch_bookly_app/core/router/app_router.dart';
import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.detailsView);
      },
      child: SizedBox(
        height: 110,
        child: Row(
          children: [
            CustomBookImage(imagePath: "assets/test/book.png"),
            Gap(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Harry Potter and the Goblet of Fire",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle20,
                  ),
                  Text(
                    "Author",
                    style: AppStyles.textStyle14.copyWith(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text("19.99 \$", style: AppStyles.textStyle20),
                      Spacer(),
                      BookRating(rating: "4.8", votes: "2390"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
