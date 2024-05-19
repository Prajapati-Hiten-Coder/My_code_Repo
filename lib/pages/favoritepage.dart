import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:my_flutter_app/widget/productcard_fav.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => Favorite_State();
}

class Favorite_State extends State<Favorite> {
  final FavoriteBloc favoriteBloc = FavoriteBloc();
  @override
  void initState() {
    favoriteBloc.add(FavoriteInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('favorite'),
        backgroundColor: Colors.blue,
      ),
      body: BlocConsumer<FavoriteBloc,FavoriteState>(
        bloc: favoriteBloc,
        listener: (context, state) {},
        buildWhen:  (previous,current)=>true,
        listenWhen: (previous,current)=>current is FavoriteActionState,
        builder: (context, state) {
          switch(state.runtimeType) {
            case FavoriteSuccessState:
              final successstate = state as FavoriteSuccessState;
              return Scaffold(
                body:
                GridView.builder(
                    itemCount: successstate.favoriteList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ProductCard_fav(
                        product: successstate.favoriteList[index],
                         favoriteBloc: favoriteBloc,
                      );
                    }
                ),
              );
            default:
              return const SizedBox();
          }

              
        },
      ),
    );
  }
}
