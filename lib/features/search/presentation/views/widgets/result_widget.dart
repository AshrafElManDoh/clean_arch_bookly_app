import 'package:clean_arch_bookly_app/core/themes/app_styles.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/views/widgets/result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Result", style: AppStyles.textStyle18),
        Gap(20),
        Expanded(child: ResultListView()),
      ],
    );
  }
}
