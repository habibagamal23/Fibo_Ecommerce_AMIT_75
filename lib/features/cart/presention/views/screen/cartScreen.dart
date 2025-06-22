import 'package:fiboecommerce/core/service_locator/service_locator.dart';
import 'package:fiboecommerce/core/widgets/primay_button_widget.dart';
import 'package:fiboecommerce/features/cart/presention/cubit/cart_cubit.dart';
import 'package:fiboecommerce/features/payment/data/repo/PaymentRepi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../payment/data/repo/paymentbyStripeimple.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartFailure) {
          return Center(child: Text(state.message));
        }

        if (state is CartSuccess) {
          return Column(
            children: [
              Text("my cart"),
              Expanded(child: ListView.builder(
                  itemCount: state.cartModel.products.length,
                  itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${state.cartModel.products[index].title}"),
                  subtitle: Text("${state.cartModel.products[index].price}"),
                );
              })),
              Text("Total price ${state.cartModel.total}"),
              Text("Total products ${state.cartModel.discountedTotal}"),
              PrimayButtonWidget(onPress: () async {
                await getIt<PaymentRepo>().makePayemnt(state.cartModel.total.toInt(), "usd");
              }, buttonText: "Buy now ")
            ],
          );
        }
        return Text("no data");
      }),
    );
  }
}
