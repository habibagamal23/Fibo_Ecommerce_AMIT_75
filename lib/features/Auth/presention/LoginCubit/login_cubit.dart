import 'package:fiboecommerce/features/Auth/data/model/UserModel.dart';
import 'package:fiboecommerce/features/Auth/data/repo/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  AuthNetwork auth = AuthNetwork();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    emit(LoginLoading());
    try {
      final user = await auth.loginUser(username.text, password.text);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }


}

