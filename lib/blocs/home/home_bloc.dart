import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState?> {
  final HomeRepository _homeRepository = HomeRepositoryImpl();

  late List<Cat> _listCats = [];

  List<Cat> get listCats => _listCats;

  HomeBloc() : super(null);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStarted) {
      try {
        yield Loading();
        _listCats = await _homeRepository.getListCats();
        yield GetListCats(listCats: listCats);
      } catch (e) {
        yield GetListCats(listCats: const []);
      }
    } else if (event is HomeSearchCats) {
      yield Loading();
      List<Cat> listCats = [];
      for (var item in this.listCats) {
        List<String> list = [
          item.name,
        ];
        bool results = list.any((element) =>
            (element.toLowerCase().contains(event.search.toLowerCase())));
        if (results) {
          listCats.add(item);
        }
      }
      if (listCats.isNotEmpty) {
        yield GetListCats(listCats: listCats);
      } else {
        yield DataEmpty();
      }
    }
  }
}
