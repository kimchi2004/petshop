import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: EdgeInsets.fromLTRB(15.w, 630.h, 15.w, 10.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width:  290.w,
                    height: 57.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff1d1d1b),
                      borderRadius:  BorderRadius.circular(19),
                    ),
                    child: Center(
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.125.h,
                          color: const Color(0xfffff9ff),
                        ),
                      ),
                    ),
                  )
                ]
            ),
          );
      }
    );
  }
}
