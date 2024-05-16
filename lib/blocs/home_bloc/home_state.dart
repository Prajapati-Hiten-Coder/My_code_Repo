part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
abstract class HomeActionState extends HomeState{}

final class HomeInitialState extends HomeState {}

class HomeLoadSuccessState extends HomeState {
  final List<Product> productlist;

  HomeLoadSuccessState({required this.productlist});

}
class HomeLoadingState extends HomeState {

}
class HomeErrorState extends HomeState{
  final String error;

  HomeErrorState({required this.error});

}
class HomeToFavoriteState extends HomeActionState{

}
class HomeToProductDetailState extends HomeActionState{

}
