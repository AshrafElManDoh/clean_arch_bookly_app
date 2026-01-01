import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class GenericUseCase<T,Params> {
  Future<Either<Failure,T>> call(Params param) ;
}