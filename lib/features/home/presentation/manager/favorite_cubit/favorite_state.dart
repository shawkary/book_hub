part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class InitialFavorite extends FavoriteState {}

final class LoadingFavoriteState extends FavoriteState {}
final class SuccessFavoriteState extends FavoriteState {}
final class ErrorFavoriteState extends FavoriteState {}

final class ReturnFromFavoriteState extends FavoriteState {}
