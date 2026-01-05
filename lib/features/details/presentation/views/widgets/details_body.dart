import 'package:clean_arch_bookly_app/core/constants/app_sizes.dart';
import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/book_actions.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/details_app_bar.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/similar_books_list_view.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.book});
  final BookEntity book;

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
                    horizontal: MediaQuery.of(context).size.width * 0.18,
                  ),
                  child: CustomBookImage(imagePath: book.image ?? ""),
                ),
                Gap(45),
                Text(book.title, style: AppStyles.textStyle30),
                // Gap(10),
                Text(
                  book.authorName,
                  style: AppStyles.textStyle14.copyWith(color: Colors.grey),
                ),
                Gap(10),
                BookRating(
                  rating: book.rating?.toString() ?? "0",
                  votes: book.votes?.toString() ?? "0",
                ),
                Gap(40),
                BookActions(previewURL: book.url),
                Gap(30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "You can also like",
                    style: AppStyles.textStyle14,
                  ),
                ),
                Gap(30),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
            builder: (context, state) {
              if (state is SimilarBooksSuccess) {
                return SimilarBooksListView(books: state.books);
              } else if (state is SimilarBooksFailure) {
                return Text(state.errMsg);
              } else {
                return Center(
                  child: CupertinoActivityIndicator(color: Colors.white),
                );
              }
            },
          ),
        ),
        SliverToBoxAdapter(child: Gap(40)),
      ],
    );
  }
}
