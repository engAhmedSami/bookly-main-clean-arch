import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errorMessage;
  FeaturedBooksPaginationFailure(this.errorMessage);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailure(this.errorMessage);
}
