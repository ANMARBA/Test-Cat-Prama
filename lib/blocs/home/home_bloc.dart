import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState?> {
  final HomeRepository _homeRepository = HomeRepositoryImpl();

  HomeBloc() : super(null);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStarted) {
      try {
        yield Loading();
        List<Cat> listCats = await _homeRepository.getListCats();
        yield GetListCats(listCats: listCats);
      } catch (e) {
        yield GetListCats(listCats: const []);
      }
    }
  }
}
