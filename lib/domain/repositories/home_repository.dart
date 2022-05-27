import 'package:test_cat_pragma/domain/entities/cat.dart';

abstract class HomeRepository {
  Future<List<Cat>> getListCats();
}
