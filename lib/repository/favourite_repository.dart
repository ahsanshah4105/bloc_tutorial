import 'package:bloc_tutorial/model/favouriteItemModel.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(Duration(seconds: 2));
    return List.of(_generateList(10));
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
      length,
          (index) => FavouriteItemModel(
        id: index.toString(),
        value: 'Item $index',
        isFavourite: false,
      ),
    );
  }
}
