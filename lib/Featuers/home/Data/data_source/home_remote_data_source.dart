import 'package:bookly/Core/utils/Funcation/save_book.dart';
import 'package:bookly/Core/utils/api_serves.dart';
import 'package:bookly/Featuers/home/Data/Models/book/book.model.dart';
import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';
import 'package:bookly/constants.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimilarBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    var data = await apiService.get(
        endPoin: 'volumes?q=stories&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data =
        await apiService.get(endPoin: 'volumes?q=stories&Sorting=newest');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks() async {
    var data = await apiService.get(endPoin: 'volumes?q=stories');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kSimilarBox);
    return books;
  }
}
