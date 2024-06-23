import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailure(this.errorMessage);
}
