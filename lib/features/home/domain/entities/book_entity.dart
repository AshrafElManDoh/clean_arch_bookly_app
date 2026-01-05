import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String authorName;
  @HiveField(4)
  final String? price;
  @HiveField(5)
  final double? rating;
  @HiveField(6)
  final int? votes;
  @HiveField(7)
  final String? category;
  @HiveField(8)
  final String url;

  BookEntity({
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.votes,
    required this.bookId,
    this.category,
    required this.url,
  });

  factory BookEntity.empty() {
    return BookEntity(
      image: '',
      title: '',
      authorName: '',
      price: '',
      rating: 0,
      votes: 0,
      bookId: '',
      url: '',
    );
  }
}
