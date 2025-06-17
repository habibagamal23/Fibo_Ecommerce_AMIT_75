import 'package:fiboecommerce/features/Home/presention/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styling/app_colors.dart';
import '../../../data/models/productModel.dart';
import '../../cubit/home_cubit.dart';

class Listproductblocbuilder extends StatelessWidget {
  const Listproductblocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeSuccess) {
            List<ProductModel> products = state.res;

            if (products.isEmpty) {
              return const Center(
                child: Text("No products found"),
              );
            }
            return Expanded(
              child: RefreshIndicator(
                color: AppColors.primaryColor,
                backgroundColor: Colors.white,
                onRefresh: () async {
                  // setState(() {});
                  context.read<HomeCubit>().getProducts();
                },
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.sp,
                    crossAxisSpacing: 16.sp,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductItemWidget(
                      productModel: products[index],
                    );
                  },
                ),
              ),
            );
          }

          return Text("there is an error");
        },
      );
  }
}
