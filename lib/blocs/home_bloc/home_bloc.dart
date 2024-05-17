// ignore_for_file: non_constant_identifier_names
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:my_flutter_app/Data/favorite_product.dart';
import 'package:my_flutter_app/Data/product_data.dart';
import 'package:my_flutter_app/Data/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {
    });
    on<HomeLoadingEvent>(homeLoadingEvent);
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeLoadSuccessEvent>(homeLoadSuccessEvent);
    on<Home_Navigateto_Fav_Event>(home_Navigateto_Fav_Event);
    on<Home_To_Productdetail_Event>(home_To_Productdetail_Event);
    on<FavroiteButtonClickEvent>(favroiteButtonClickEvent);

  }
  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    try
        {
          emit(HomeLoadingState());
          await Future.delayed(const Duration(seconds: 3));
          emit(HomeLoadSuccessState(productlist: Product_data.productList.map((e) => Product(
              id: e['id'],
              image: e['image'],
              name: e['name'],
              price: e['price'])).toList()
          )
          );
        }
        catch (error)
       {
        emit(HomeErrorState(error: error.toString()));
       }
  }

  FutureOr<void> homeLoadingEvent(HomeLoadingEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
  }



  FutureOr<void> homeLoadSuccessEvent(HomeLoadSuccessEvent event, Emitter<HomeState> emit) {

  }

  FutureOr<void> home_Navigateto_Fav_Event(Home_Navigateto_Fav_Event event, Emitter<HomeState> emit) {
    emit(HomeToFavoriteState());
  }

  FutureOr<void> home_To_Productdetail_Event(Home_To_Productdetail_Event event, Emitter<HomeState> emit) {
    emit(HomeToProductDetailState());
  }

  FutureOr<void> favroiteButtonClickEvent(FavroiteButtonClickEvent event, Emitter<HomeState> emit) {
      print('favorite clicked');
      favoritelist.add(event.product);
      emit(HomeProductFavoritedActionState());
  }
}


