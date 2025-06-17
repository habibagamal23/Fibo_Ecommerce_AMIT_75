import 'package:fiboecommerce/core/routing/router_generation_config.dart';
import 'package:fiboecommerce/features/Home/presention/cubit/home_cubit.dart';
import 'package:fiboecommerce/features/cart/presention/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/styling/app_colors.dart';
import '../../../../../core/styling/app_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/spacing_widgets.dart';
import '../../../data/models/productModel.dart';
import '../widgets/ListProductBlocBuilder.dart';
import '../widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<CartCubit>().getmyCart();
                context.push(RouterGeneration.cartScreen);
              },
              icon: Icon(Icons.add_shopping_cart))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeightSpace(28),
            SizedBox(
              width: 335.w,
              child: Text(
                "Discover",
                style: AppStyles.primaryHeadLinesStyle,
              ),
            ),
            const HeightSpace(16),
            Row(
              children: [
                CustomTextField(
                  width: 270.w,
                  hintText: "Search For Clothes",
                ),
                const WidthSpace(8),
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const HeightSpace(16),

            /// categories
            Listproductblocbuilder()
          ],
        ),
      ),
    );
  }
}
