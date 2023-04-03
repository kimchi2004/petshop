import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/home/home_screen.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                color: Colors.black,
                icon: const Icon(Icons.chevron_left),
                padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.w, 0.h),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                  },
                  color: Colors.black,
                  icon: const Icon(Icons.favorite_border),
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 20.w, 0.h),
                ),
              ]),
          body: Container(
            padding: EdgeInsets.fromLTRB(40.w, 0.h, 0.w, 0.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                  width: 260.w,
                  height: 260.h,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                        child: const Image(
                          image: AssetImage('assets/images/product.jpg'),
                          fit: BoxFit.cover,
                        ),
                      )
                      //pagination
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
