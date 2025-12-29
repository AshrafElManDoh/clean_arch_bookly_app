import 'package:clean_arch_bookly_app/core/network/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var response = await apiService.get(
      endPoint: "volumes?filter=free-ebooks&q=sports",
    );
    List<BookEntity> books = getList(response);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var response = await apiService.get(
      endPoint: "volumes?filter=free-ebooks&q=sports&sorting=newest",
    );
    List<BookEntity> books = getList(response);
    return books;
  }

  List<BookEntity> getList(Map<String, dynamic> response) {
    List<BookEntity> books = [];
    for (var bookMap in response['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
