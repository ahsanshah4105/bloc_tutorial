import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/model/favouriteItemModel.dart';
import 'package:bloc_tutorial/repository/favourite_repository.dart';
import 'package:equatable/equatable.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';


class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavouriteRepository favouriteRepository;

  FavouriteBloc({required this.favouriteRepository})
      : super(const FavouriteInitial()) {
    on<FetchFavouriteList>(_fetchList);
    on<ToggleFavouriteStatus>(_toggleFavouriteStatus);
    add(FetchFavouriteList());
  }

  Future<void> _fetchList(
      FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    emit(state.copyWith(listStatus: ListStatus.loading));
    try {
      final items = await favouriteRepository.fetchItem();
      emit(state.copyWith(
        favouriteItemList: items,
        listStatus: ListStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(listStatus: ListStatus.failure));
    }
  }

  void _toggleFavouriteStatus(
      ToggleFavouriteStatus event, Emitter<FavouriteState> emit) {
    final updatedList = state.favouriteItemList.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(isFavourite: !item.isFavourite);
      }
      return item;
    }).toList();

    emit(state.copyWith(favouriteItemList: updatedList));
  }


}
