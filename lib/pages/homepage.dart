import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/blocs/home_bloc/home_bloc.dart';
import 'package:my_flutter_app/pages/favoritepage.dart';
import 'package:my_flutter_app/widget/productcard.dart';

void main() {
  runApp(const home_Screen());
}

class home_Screen extends StatefulWidget {
  const home_Screen({super.key});

  @override
  State<home_Screen> createState() => homepage();
}

class homepage extends State<home_Screen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) =>  current is !HomeActionState,
        listener: (context, state) {
          if(state is HomeToFavoriteState)
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Favorite()));
            }
        else if(state is HomeProductFavoritedActionState)
          {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('added to favroite')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeInitialState:
              return const Scaffold(
                body: Center(child: Text('Loading...')),
              );
            case HomeLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case HomeLoadSuccessState:
              final successstate =state as HomeLoadSuccessState;
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: const Text("HomeScreen"),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(Home_Navigateto_Fav_Event());
                        },
                        icon: const Icon(Icons.favorite)),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.shopping_cart))
                  ],
                ),
                body: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: successstate.productlist.length,
                    itemBuilder: (context,index){
                      return ProductCard(product: successstate.productlist[index],homeBloc: homeBloc,);
                    })
              );

            case HomeErrorState:
              final errorState = state as HomeErrorState;
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${errorState.error}'),
                    ],
                  ),
                ),
              );
            default:
              return const Scaffold(
                  body: Center(child: Text('wrong')));
          }
        });
  }
}
