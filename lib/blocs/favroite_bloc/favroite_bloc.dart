import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favroite_event.dart';
part 'favroite_state.dart';

class FavroiteBloc extends Bloc<FavroiteEvent, FavroiteState> {
  FavroiteBloc() : super(FavroiteInitial()) {
    on<FavroiteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
