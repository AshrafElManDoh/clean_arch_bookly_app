import 'package:clean_arch_bookly_app/core/base_fuctions/cache_box.dart';
import 'package:clean_arch_bookly_app/core/base_fuctions/get_books_list.dart';
import 'package:clean_arch_bookly_app/core/constants/constants.dart';
import 'package:clean_arch_bookly_app/core/network/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var response = await apiService.get(
      endPoint: "volumes?filter=free-ebooks&q=sports&startIndex=${pageNumber * 10}",
    );
    List<BookEntity> books = getBooksList(response);
    cacheBooks(books, kOpenFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response = await apiService.get(
      endPoint: "volumes?filter=free-ebooks&q=sports&sorting=newest",
    );
    List<BookEntity> books = getBooksList(response);
    cacheBooks(books, kOpenNewestBox);
    return books;
  }
}
