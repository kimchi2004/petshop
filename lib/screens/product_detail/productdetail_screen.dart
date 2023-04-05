import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/product_detail/widgets/product_info.dart';
import 'package:petshop/screens/product_detail/widgets/product_rating.dart';
import 'package:petshop/screens/product_detail/widgets/productorder_info.dart';
import 'package:petshop/screens/product_detail/widgets/quantity_counter.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: const [
                    ProductInfo(),
                    ProductRating(maxRating: 5),
                    QuantityCounter(),
                    ProductOrderInfo(),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
