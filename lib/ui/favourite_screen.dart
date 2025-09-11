import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/favourite/favourite_bloc.dart';
import '../model/favouriteItemModel.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items"),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          if (state.listStatus == ListStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.listStatus == ListStatus.failure) {
            return const Center(child: Text("Failed to load favourites"));
          }

          if (state.favouriteItemList.isEmpty) {
            return const Center(child: Text("No favourites yet"));
          }

          return ListView.builder(
            itemCount: state.favouriteItemList.length,
            itemBuilder: (context, index) {
              final item = state.favouriteItemList[index];
              return ListTile(
                title: Text(item.value),
                trailing: IconButton(
                  icon: Icon(
                    item.isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: item.isFavourite ? Colors.red : null,
                  ),
                  onPressed: () {
                    context.read<FavouriteBloc>().add(ToggleFavouriteStatus(item.id));
                  },
                ),
              );
            },
          );

        },
      ),

    );
  }
}
