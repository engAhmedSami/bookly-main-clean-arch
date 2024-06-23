import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';
import '../../Domain/entity/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int lenth = box.values.length;
    if (lenth >= startIndex || endIndex > lenth) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchSimilarBooks() {
    var box = Hive.box<BookEntity>(kSimilarBox);
    return box.values.toList();
  }
}
