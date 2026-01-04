import 'package:clean_arch_bookly_app/features/details/presentation/views/widgets/details_body.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: DetailsBody(book: book)),
    );
  }
}
