import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/product_detail/widgets/product_info.dart';
import 'package:petshop/screens/product_detail/widgets/product_rating.dart';
import 'package:petshop/screens/product_detail/widgets/productorder_info.dart';
import 'package:petshop/screens/product_detail/widgets/quantity_counter.dart';


class ProductDetail extends StatefulWidget {
  late int id;
  ProductDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with SingleTickerProviderStateMixin {

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
                    children: [
                       ProductInfo(id: widget.id ),
                      const ProductRating(maxRating: 5),
                      const QuantityCounter(),
                      const ProductOrderInfo(),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
