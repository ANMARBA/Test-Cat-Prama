import 'package:test_cat_pragma/data/services/home_service_impl.dart';
import 'package:test_cat_pragma/domain/entities/cat.dart';
import 'package:test_cat_pragma/domain/repositories/home_repository.dart';
import 'package:test_cat_pragma/domain/services/home_service.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService _homeService = HomeServiceImpl();

  @override
  Future<List<Cat>> getListCats() async {
    return await _homeService.getListCats();
  }
}
