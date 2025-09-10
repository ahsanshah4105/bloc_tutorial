part of 'favourite_bloc.dart';

enum ListStatus { initial, loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final ListStatus listStatus;

  const FavouriteState({
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.initial,
  });

  FavouriteState copyWith({
    List<FavouriteItemModel>? favouriteItemList,
    ListStatus? listStatus,
  }) {
    return FavouriteState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favouriteItemList, listStatus];
}

class FavouriteInitial extends FavouriteState {
  const FavouriteInitial() : super(favouriteItemList: const [], listStatus: ListStatus.initial);
}
