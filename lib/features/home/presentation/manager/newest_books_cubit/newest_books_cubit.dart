import 'dart:developer';

import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  List<BookEntity> mainBooks = [];

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    log("Newest Loading");
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }

    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((failure) => emit(NewestBooksFailure(errMsg: failure.errMsg)), (
      books,
    ) {
      mainBooks.addAll(books);
      log("Newest Success");
      emit(NewestBooksSuccess(books: mainBooks));
    });
  }
}
