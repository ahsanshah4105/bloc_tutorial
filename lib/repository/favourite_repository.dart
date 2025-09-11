import 'package:bloc_tutorial/model/favouriteItemModel.dart';

import '../database/database_helper.dart';

import 'package:bloc_tutorial/model/favouriteItemModel.dart';
import '../database/database_helper.dart';

class FavouriteRepository {
  final db = DatabaseHelper();

  Future<List<FavouriteItemModel>> fetchItem() async {
    final rows = await db.getFavourites();

    if (rows.isEmpty) {
      // Seed database once
      final items = _generateList(10);
      for (var item in items) {
        await upsertFavourite(item);
      }
      return items;
    }

    return rows.map((row) {
      return FavouriteItemModel(
        id: row['id'].toString(),
        value: row['value'].toString(),
        isFavourite: row['isFavourite'] == 1,
      );
    }).toList();
  }

  Future<void> upsertFavourite(FavouriteItemModel item) async {
    await db.insertFavourite({
      'id': item.id,
      'value': item.value,
      'isFavourite': item.isFavourite ? 1 : 0,
    });
  }

  Future<void> deleteFavourite(String id) async {
    await db.deleteFavourites(id);
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
