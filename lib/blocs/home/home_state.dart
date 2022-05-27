import 'package:equatable/equatable.dart';
import 'package:test_cat_pragma/domain/entities/cat.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetListCats extends HomeState {
  final List<Cat> listCats;

  GetListCats({required this.listCats});

  @override
  List<Object> get props => [listCats];

  @override
  String toString() => 'GetListCats { Cats: $listCats }';
}

class Loading extends HomeState {}

class DataEmpty extends HomeState {}
