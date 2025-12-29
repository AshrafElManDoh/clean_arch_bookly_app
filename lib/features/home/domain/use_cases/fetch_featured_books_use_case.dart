import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:clean_arch_bookly_app/core/use_case/use_case.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
