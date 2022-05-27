import 'package:test_cat_pragma/domain/entities/cat.dart';

abstract class HomeService {
  Future<List<Cat>> getListCats();
}
