import 'package:clean_arch_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

List<BookEntity> getBooksList(Map<String, dynamic> response) {
  List<BookEntity> books = [];
  for (var bookMap in response['items']) {
    books.add(BookModel.fromJson(bookMap));
  }
  return books;
}
