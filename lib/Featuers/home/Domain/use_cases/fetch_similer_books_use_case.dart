import 'package:bookly/Core/errors/failure.dart';
import 'package:bookly/Core/use_case/use_case.dart';
import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';
import 'package:bookly/Featuers/home/Domain/repo/home_repo.dart';
import 'package:bookly/Featuers/home/Domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase extends UseCase<List<BookEntity>, NoPram> {
  final HomeRepo homeRepo;
  FetchSimilarBooksUseCase(
    this.homeRepo,
    this.category,
  );
  final String category;

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoPram? param]) async {
    return await homeRepo.fetchSimilarBooks(
      category: category,
    );
  }
}
