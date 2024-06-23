import 'package:bookly/Featuers/home/Domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/featch_newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();

    result.fold(
      (failure) {
        emit(NewestBooksFailure(failure.message));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
