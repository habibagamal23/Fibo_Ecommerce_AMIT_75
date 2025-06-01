import 'package:fiboecommerce/features/Auth/presention/LoginCubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/router_generation_config.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/primay_button_widget.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // text username , passwod , button

          CustomTextField(
            hintText: "username",
            controller: context.read<LoginCubit>().username,
          ),
          CustomTextField(
            hintText: "Password",
            controller: context.read<LoginCubit>().password,
          ),

          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("welcome to my app ${state.user.username}")));
                context.go(RouterGeneration.home);
              }
              if (state is LoginError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return PrimayButtonWidget(
                buttonText: "Login",
                onPress: () {
                  context.read<LoginCubit>().login();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
