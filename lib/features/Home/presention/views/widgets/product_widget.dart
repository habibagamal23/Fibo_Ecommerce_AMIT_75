import 'package:cached_network_image/cached_network_image.dart';
import 'package:fiboecommerce/features/Home/data/models/productModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/router_generation_config.dart';
import '../../../../../core/styling/app_styles.dart';
import '../../../../../core/widgets/spacing_widgets.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductItemWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(RouterGeneration.productScreenDetailes, extra: productModel);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  width: 150.w,
                  height: 190.h,
                  fit: BoxFit.cover,
                  imageUrl: "${productModel.thumbnail}",
                )),
            const HeightSpace(8),
            Text("${productModel.title}",
                maxLines: 1, style: AppStyles.black15BoldStyle),
            const HeightSpace(8),
            Text("${productModel.price}",
                style: AppStyles.grey12MediumStyle
                    .copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
