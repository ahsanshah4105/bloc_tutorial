part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvent {}

class ToggleFavouriteStatus extends FavouriteEvent {
  final String itemId; // identify which item to toggle

  const ToggleFavouriteStatus(this.itemId);

  @override
  List<Object?> get props => [itemId];
}
