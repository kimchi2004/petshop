
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
        return Container(
          padding: EdgeInsets.fromLTRB(10.w, 40.h, 0.w, 0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.w, 0.9.h, 31.99.w, 0.h),
                width: 10.w,
                height: 18.h,
                child: IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  color: Colors.black,
                  icon: const Icon(
                      Icons.chevron_left
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.w, 5.8.h, 0.w, 0.h),
                width: 280.33.w,
                height: 293.99.h,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(2.6.w,88.h, 0.w, 0.h),
                      child: SizedBox(
                        width: 277.78.w,
                        height: 205.95.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 30.h),
                              width: 277.79.w,
                              height: 168.12.h,
                              child: Image(
                                image: const AssetImage('assets/images/blank.jpg'),
                                width: 277.79.w,
                                height: 168.12.h,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0.w, 0.h, 2.86.w, 2.86.h),
                              width: 29.89.w,
                              height: 3.h,
                              child: Image(
                                image: const AssetImage('assets/images/slide.jpg'),
                                width: 28.89.w,
                                height: 3.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                      child: Align(
                        child: SizedBox(
                          width: 260.w,
                          height: 260.h,
                          child: const Image(
                            image: AssetImage('assets/images/product.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                width: 10.w,
                height: 18.h,
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
