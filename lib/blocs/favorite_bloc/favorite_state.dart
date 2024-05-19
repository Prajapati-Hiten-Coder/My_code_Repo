part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {
}
class FavoriteActionState extends FavoriteState
 {

 }
final class FavoriteInitial extends FavoriteState {}

class FavoriteSuccessState extends FavoriteState
{
  final List<Product> favoriteList;

  FavoriteSuccessState({required this.favoriteList});
}
class FavoriteItemRemoveState extends FavoriteState
{

}

