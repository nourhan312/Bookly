import 'package:bookly/features/home/data/models/book/book.dart';
import 'package:bookly/features/home/presentation/manager/similar_books/similar_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});

  final Book book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBookCubit>(context)
        .fetchSimilarBooks(category: widget.book.volumeInfo?.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(
        book: widget.book,
      ),
    );
  }
}
