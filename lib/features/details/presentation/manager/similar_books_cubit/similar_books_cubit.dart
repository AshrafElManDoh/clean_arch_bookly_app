import 'package:clean_arch_bookly_app/features/details/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase)
    : super(SimilarBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var response = await fetchSimilarBooksUseCase.call(category);
    response.fold(
      (error) => emit(SimilarBooksFailure(errMsg: error.errMsg)),
      (books) => emit(SimilarBooksSuccess(books: books)),
    );
  }
}
