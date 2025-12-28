import 'package:clean_arch_bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BookItem(),
      separatorBuilder: (context, index) => Gap(10),
      itemCount: 10,
    );
  }
}
