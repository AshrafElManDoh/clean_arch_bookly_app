import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeaturedBookListViewBlocBuilder extends StatefulWidget {
  const FeaturedBookListViewBlocBuilder({super.key});

  @override
  State<FeaturedBookListViewBlocBuilder> createState() =>
      _FeaturedBookListViewBlocBuilderState();
}

class _FeaturedBookListViewBlocBuilderState
    extends State<FeaturedBookListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        // if (state is FeaturedBooksFailure) {
        //   return Center(child: Text(state.errMsg));
        // } else if (state is FeaturedBooksSuccess ||
        //     state is FeaturedBooksPaginationLoading) {
        //   return FeaturedBookListView(books: books);
        // }
        return Skeletonizer(
          enabled: true,
          enableSwitchAnimation: true,
          effect: ShimmerEffect(
            baseColor: Colors.grey.shade600,
            highlightColor: Colors.grey.shade100,
          ),
          child: FeaturedBookListView(
            books: List.generate(5, (index) => BookEntity.empty()),
          ),
        );
      },
    );
  }
}
