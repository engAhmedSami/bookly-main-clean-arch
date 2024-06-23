import 'package:bookly/Core/errors/failure.dart';
import 'package:bookly/Core/use_case/use_case.dart';
import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';
import 'package:bookly/Featuers/home/Domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepo.fetchFeaturedBooks(
      pageNumber: param,
    );
  }
}

//كلاس يعبر ع اني مش هبعت حاجه للمعلومات
class NoPram {}
