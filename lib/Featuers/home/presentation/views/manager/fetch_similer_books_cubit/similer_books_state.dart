import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';

abstract class SimilerBooksState {}

class SimilerBooksInitial extends SimilerBooksState {}

class SimilerBooksLoading extends SimilerBooksState {}

class SimilerBooksSuccess extends SimilerBooksState {
  final List<BookEntity> books;

  SimilerBooksSuccess(this.books);
}

class SimilerBooksFailure extends SimilerBooksState {
  final String errorMessage;

  SimilerBooksFailure(this.errorMessage);
}
