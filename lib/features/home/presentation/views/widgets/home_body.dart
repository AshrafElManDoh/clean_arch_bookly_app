import 'package:clean_arch_bookly_app/core/constants/app_sizes.dart';
import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/featured_book_list_view_bloc_builder.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/newest_books_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late ScrollController _scrollController;
  bool isLoading = false;
  int nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(newestBooksListener);
  }

  void newestBooksListener() async {
    double currentPosition = _scrollController.position.pixels;
    double maxScrollExtent = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollExtent && !isLoading) {
      isLoading = true;
      await BlocProvider.of<NewestBooksCubit>(
        context,
      ).fetchNewestBooks(pageNumber: nextPage++);
      isLoading = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
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
        NewestBooksBlocConsumer(),
      ],
    );
  }
}
