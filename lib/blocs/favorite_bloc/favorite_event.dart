part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class FavoriteInitialEvent extends FavoriteEvent
{

}
class FavoriteRemovedEvent extends FavoriteEvent
{
  final Product product;

  FavoriteRemovedEvent({required this.product});
}