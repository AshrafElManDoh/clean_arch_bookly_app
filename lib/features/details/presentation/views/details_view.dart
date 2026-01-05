import 'package:clean_arch_bookly_app/core/base_fuctions/get_it.dart';
import 'package:clean_arch_bookly_app/features/details/data/repos/details_repo_imp.dart';
import 'package:clean_arch_bookly_app/features/details/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/details_body.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SimilarBooksCubit(
            FetchSimilarBooksUseCase(detailsRepo: getIt.get<DetailsRepoImp>()),
          )..fetchSimilarBooks(category: "sports"),
          child: DetailsBody(book: book),
        ),
      ),
    );
  }
}
