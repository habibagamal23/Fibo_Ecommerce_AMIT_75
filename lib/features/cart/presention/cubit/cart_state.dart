part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final CartModel cartModel;
  CartSuccess(this.cartModel);
}

final class CartFailure extends CartState {
  final String message;
  CartFailure(this.message);
}

final class CartAdding extends CartState {}

final class CartAddedSuccess extends CartState {
  CartModel cartModel;
  CartAddedSuccess(this.cartModel);
}

final class CartAddedFailure extends CartState {
  final String message;
  CartAddedFailure(this.message);
}
