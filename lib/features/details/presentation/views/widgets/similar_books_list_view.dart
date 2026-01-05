import 'package:clean_arch_bookly_app/core/constants/app_sizes.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.books});
  final List<BookEntity> books ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            CustomBookImage(imagePath: books[index].image??""),
        separatorBuilder: (context, index) => Gap(10),
        itemCount: books.length,
      ),
    );
  }
}
