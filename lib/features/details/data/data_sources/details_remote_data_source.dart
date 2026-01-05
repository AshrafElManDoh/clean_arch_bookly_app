import 'package:clean_arch_bookly_app/core/base_fuctions/get_books_list.dart';
import 'package:clean_arch_bookly_app/core/network/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class DetailsRemoteDataSource {
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

class DetailsRemoteDataSourceImp implements DetailsRemoteDataSource {
  final ApiService apiService;

  DetailsRemoteDataSourceImp({required this.apiService});
  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var response = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category',
    );
    List<BookEntity> books = getBooksList(response);
    return books;
  }
}
