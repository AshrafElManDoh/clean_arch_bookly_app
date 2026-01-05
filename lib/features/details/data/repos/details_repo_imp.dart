import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:clean_arch_bookly_app/core/errors/server_failure.dart';
import 'package:clean_arch_bookly_app/features/details/data/data_sources/details_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/details/domain/repos/details_repo.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DetailsRepoImp implements DetailsRepo {
  final DetailsRemoteDataSource detailsRemoteDataSource;

  DetailsRepoImp({required this.detailsRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var books = await detailsRemoteDataSource.fetchSimilarBooks(
        category: category,
      );
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioExceptions(e));
      } else {
        return left(ServerFailure(errMsg: e.toString()));
      }
    }
  }
}
