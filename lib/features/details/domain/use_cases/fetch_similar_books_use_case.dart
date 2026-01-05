import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:clean_arch_bookly_app/core/use_case/use_case_with_params.dart';
import 'package:clean_arch_bookly_app/features/details/domain/repos/details_repo.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase
    extends GenericUseCase<List<BookEntity>, String> {
  final DetailsRepo detailsRepo;

  FetchSimilarBooksUseCase({required this.detailsRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(String param) {
    return detailsRepo.fetchSimilarBooks(category: param);
  }
}
