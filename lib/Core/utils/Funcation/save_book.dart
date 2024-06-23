import 'package:bookly/Featuers/home/Domain/entity/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String booxName) {
  var box = Hive.box<BookEntity>(booxName);
  box.addAll(books);
}
