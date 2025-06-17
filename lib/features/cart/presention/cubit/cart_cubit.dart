import 'package:bloc/bloc.dart';
import 'package:fiboecommerce/features/cart/data/repo/cartRepo.dart';
import 'package:meta/meta.dart';

import '../../data/model/CartModel.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  CartRepo cartRepo;

  getmyCart() async {
    emit(CartLoading());
    final result = await cartRepo.getCart();
    result.fold(
        (l) => emit(CartFailure(l.message)), (r) => emit(CartSuccess(r)));
  }

  addtomyCart(int id, int quantity) async {
    emit(CartAdding());
    final result = await cartRepo.AddProduct(id, quantity);
    result.fold((l) => emit(CartAddedFailure(l.message)),
        (r) => emit(CartAddedSuccess(r)));
  }
}
