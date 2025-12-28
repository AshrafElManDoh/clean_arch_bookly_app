import 'package:clean_arch_bookly_app/core/constants/app_sizes.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: Icon(Icons.close, size: 30),
              ),
              Gap(10),
              Expanded(child: CustomSearchTextField()),
            ],
          ),
          Gap(30),
          Expanded(child: ResultWidget()),
        ],
      ),
    );
  }
}
