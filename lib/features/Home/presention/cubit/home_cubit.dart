import 'package:bloc/bloc.dart';
import 'package:fiboecommerce/features/Home/data/models/productModel.dart';
import 'package:fiboecommerce/features/Home/data/models/response_products_model.dart';
import 'package:fiboecommerce/features/Home/data/repos/HomeRepostiy.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  HomeRepo homeRepo;

  getProducts() async {
    emit(HomeLoading());
    final result = await homeRepo.getAllProducts();
    result.fold((l) => emit(HomeError(l.message)),
        (r) => emit(HomeSuccess(r.products)));
  }
}
