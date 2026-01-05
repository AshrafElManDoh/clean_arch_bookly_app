import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DetailsRepo
{
  Future<Either<Failure,List<BookEntity>>> fetchSimilarBooks({required String category});
}