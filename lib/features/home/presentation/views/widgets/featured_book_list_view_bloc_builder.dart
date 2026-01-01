import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeaturedBookListViewBlocBuilder extends StatelessWidget {
  const FeaturedBookListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.errMsg));
        } else if (state is FeaturedBooksSuccess) {
          return FeaturedBookListView(books: state.books);
        }
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
