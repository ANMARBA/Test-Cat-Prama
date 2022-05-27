import 'package:test_cat_pragma/commons/api/api_manager.dart';
import 'package:test_cat_pragma/data/models/cat_model.dart';
import 'package:test_cat_pragma/domain/entities/cat.dart';
import 'package:test_cat_pragma/domain/services/home_service.dart';

class HomeServiceImpl implements HomeService {
  final APIManager _apiManager = APIManager();
  final CatModel _catModel = CatModel();

  @override
  Future<List<Cat>> getListCats() async {
    var data = await _apiManager.getAPICall(
      'https://api.thecatapi.com/v1/breeds',
      headers: {"x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39"},
      timeLimit: const Duration(seconds: 60),
    );

    final List<Cat> listCats = (data as List)
        .map((res) => _catModel.fromJson(res as Map<String, dynamic>))
        .toList();

    return Future.value(listCats);
  }
}
