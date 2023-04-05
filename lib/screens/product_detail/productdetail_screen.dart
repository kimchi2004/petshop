import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/product_detail/widgets/product_info.dart';
import 'package:petshop/screens/product_detail/widgets/product_rating.dart';
import 'package:petshop/screens/product_detail/widgets/productorder_info.dart';
import 'package:petshop/screens/product_detail/widgets/quantity_counter.dart';


class ProductDetail extends StatefulWidget {
  final int petId;

  const ProductDetail({Key? key, required this.petId}) : super(key: key);

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
                       ProductInfo(petId: widget.petId),
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
