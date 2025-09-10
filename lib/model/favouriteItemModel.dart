import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable {
  final String id;
  final String value;
  final bool isFavourite;
  final bool isDeleting;
  const FavouriteItemModel({
    required this.id,
    required this.value,
    this.isFavourite = false,
    this.isDeleting = false,
  });

  FavouriteItemModel copyWith({
    String? id,
    String? value,
    bool? isFavourite,
    bool? isDeleting,
  }) {
    return FavouriteItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isFavourite: isFavourite ?? this.isFavourite,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  @override
  List<Object?> get props => [id, value, isFavourite, isDeleting];
}
