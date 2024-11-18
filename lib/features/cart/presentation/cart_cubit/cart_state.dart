part of 'cart_cubit.dart';

sealed class CartStates extends Equatable {
  const CartStates();

  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartStates {}
final class CartSucessState extends CartStates {}
final class CartErrorState extends CartStates {}
final class CartLoadingState extends CartStates {}
