import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_flutter_app/Data/favorite_product.dart';
import 'package:my_flutter_app/Data/product_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FavoriteInitialEvent>(favoriteInitialEvent);
    on<FavoriteRemovedEvent>(favoriteRemovedEvent);
  }

  FutureOr<void> favoriteInitialEvent(FavoriteInitialEvent event,
      Emitter<FavoriteState> emit) {
    emit(FavoriteSuccessState(favoriteList: favoritelist));
  }


  FutureOr<void> favoriteRemovedEvent(FavoriteRemovedEvent event, Emitter<FavoriteState> emit) {
    favoritelist.remove(event.product);
    emit(FavoriteSuccessState(favoriteList: favoritelist));
  }
}