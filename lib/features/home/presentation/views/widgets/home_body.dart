import 'package:clean_arch_bookly_app/core/constants/app_sizes.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/featured_book_list_view_bloc_builder.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/newest_books_section.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ///AppBar + featured list
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalPadding,
                  vertical: AppSizes.verticalPadding,
                ),
                child: HomeAppBar(),
              ),
              FeaturedBookListViewBlocBuilder(),
              Gap(20),
            ],
          ),
        ),

        ///best seller
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
          sliver: NewestBooksSection(),
        ),
      ],
    );
  }
}
