import 'package:clean_arch_bookly_app/core/constants/app_sizes.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewestBooksBlocConsumer extends StatelessWidget {
  const NewestBooksBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final newestCubit = context.read<NewestBooksCubit>();
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(child: Text(state.errMsg));
        } else if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalPadding,
            ),
            sliver: SliverList.separated(
              itemBuilder: (context, index) =>
                  BookItem(book: newestCubit.mainBooks[index]),
              separatorBuilder: (context, index) => Gap(10),
              itemCount: newestCubit.mainBooks.length,
            ),
          );
        }
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
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
                  url: '',
                  category: '',
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
    );
  }
}
