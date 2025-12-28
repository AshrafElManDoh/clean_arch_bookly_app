import 'package:clean_arch_bookly_app/core/constants/app_sizes.dart';
import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/book_actions.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/details_app_bar.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/similar_books_list_view.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalPadding,
            ),
            child: Column(
              children: [
                DetailsAppBar(),
                Gap(45),
                Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.18),
              child:  CustomBookImage(imagePath: "assets/test/book.png"),
            ),
                Gap(45),
                Text("The Jungle Book", style: AppStyles.textStyle30),
                // Gap(10),
                Text(
                  "Rudyard Kipling",
                  style: AppStyles.textStyle14.copyWith(color: Colors.grey),
                ),
                Gap(10),
                BookRating(rating: "4.8", votes: "2540"),
                Gap(40),
                BookActions(),
                Gap(30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "You can also like",
                    style: AppStyles.textStyle14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SimilarBooksListView()),
        SliverToBoxAdapter(child: Gap(40),)
      ],
    );
  }
}
