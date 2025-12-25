import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) =>
            CustomBookImage(imagePath: "assets/test/book.png"),
        separatorBuilder: (context, index) => Gap(10),
        itemCount: 5,
      ),
    );
  }
}
