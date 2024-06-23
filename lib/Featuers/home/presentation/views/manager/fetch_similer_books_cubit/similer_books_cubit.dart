import 'package:bookly/Featuers/home/Domain/use_cases/fetch_similer_books_use_case.dart';
import 'package:bookly/Featuers/home/presentation/views/manager/fetch_similer_books_cubit/similer_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.fetchSimilarBooksUseCase)
      : super(SimilerBooksInitial());
  final FetchSimilarBooksUseCase fetchSimilarBooksUseCase;
  Future<void> fetchSimilarBooks() async {
    emit(SimilerBooksLoading());
    final result = await fetchSimilarBooksUseCase.call();
    result.fold((failure) {
      emit(SimilerBooksFailure(failure.message));
    }, (books) {
      emit(SimilerBooksSuccess(books));
    });
  }
}
