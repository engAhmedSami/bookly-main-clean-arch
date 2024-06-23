import 'package:bookly/Featuers/home/Domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/fetch_featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeaturedBooksUseCase)
      : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeaturedBooksUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(failure.message));
        } else {
          emit(FeaturedBooksPaginationFailure(failure.message));
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
