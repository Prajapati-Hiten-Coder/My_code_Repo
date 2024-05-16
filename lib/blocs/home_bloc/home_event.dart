part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent
{

}
class HomeLoadingEvent extends HomeEvent
{

}
class HomeLoadSuccessEvent extends HomeEvent
{

}
class FavroiteButtonClickEvent extends HomeEvent
{

}
class Home_Navigateto_Fav_Event extends HomeEvent
{

}
class Home_To_Productdetail_Event extends HomeEvent
{

}
