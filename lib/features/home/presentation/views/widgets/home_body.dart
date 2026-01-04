import 'package:clean_arch_bookly_app/core/constants/app_sizes.dart';
import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/featured_book_list_view_bloc_builder.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
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

        ///newest books
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Newest Books", style: AppStyles.textStyle18),
                Gap(20),
              ],
            ),
          ),
        ),
        BlocConsumer<NewestBooksCubit, NewestBooksState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            // if (state is NewestBooksFailure) {
            //   return SliverToBoxAdapter(child: Text(state.errMsg));
            // } else if (state is NewestBooksSuccess) {
            //   return SliverPadding(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: AppSizes.horizontalPadding,
            //     ),
            //     sliver: SliverList.separated(
            //       itemBuilder: (context, index) =>
            //           BookItem(book: state.books[index]),
            //       separatorBuilder: (context, index) => Gap(10),
            //       itemCount: state.books.length,
            //     ),
            //   );
            // } else {
            //   return SliverList.separated(
            //     itemBuilder: (context, index) =>
            //         Skeletonizer(child: BookItem(book: BookEntity.empty())),
            //     separatorBuilder: (context, index) => Gap(10),
            //     itemCount: 7,
            //   );
            // }

            return SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalPadding,
              ),
              sliver: SliverList.separated(
                itemBuilder: (context, index) => Skeletonizer(
                  enabled: true,
                  enableSwitchAnimation: true,
                  effect: ShimmerEffect(
                    baseColor: Colors.grey.shade600,
                    highlightColor: Colors.grey.shade100,
                  ),
                  child: BookItem(
                    book: BookEntity(
                      image: '',
                      title: "xxxxxxxxxxxx",
                      authorName: "authorName",
                      price: "Free",
                      rating: 0,
                      votes: 0,
                      bookId: "bookId",
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Gap(10),
                itemCount: 7,
              ),
            );
          },
        ),
      ],
    );
  }
}
