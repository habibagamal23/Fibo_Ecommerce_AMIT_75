import 'package:fiboecommerce/features/Auth/data/model/UserModel.dart';
import 'package:fiboecommerce/features/Auth/data/repo/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepository _auth;

  LoginCubit(this._auth) : super(LoginInitial());

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    emit(LoginLoading());
    try {
      final result = await _auth.loginUserbyApi(username.text, password.text);
      result.fold((failer) => emit(LoginError(failer.message)),
          (user) => emit(LoginSuccess(user)));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
    username.dispose();
    password.dispose();
  }

}

