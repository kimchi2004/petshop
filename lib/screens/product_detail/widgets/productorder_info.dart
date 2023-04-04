import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductOrderInfo extends StatefulWidget {
  const ProductOrderInfo({Key? key}) : super(key: key);

  @override
  State<ProductOrderInfo> createState() => _ProductOrderInfoState();
}

class _ProductOrderInfoState extends State<ProductOrderInfo> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.fromLTRB(20.w, 460.h, 0.w, 0.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0.w, 0.h,38.w,0.45.h),
                        child: Text(
                          'Repeat Order',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.125.h,
                            color: const Color(0xff181725),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.w, 0.45.h,7.w, 0.h),
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.125.h,
                            decoration: TextDecoration.underline,
                            color: const Color(0xffff7322),
                            decorationColor:  const Color(0xffff7322),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(14.w, 12.h, 10.w, 12.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffe2e2e2),
                      ),
                      color: const Color(0x33ffffff),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'No thanks',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            height: 1.29.h,
                            color: const Color(0xff181725),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 2,
                endIndent: 24,
                height: 17.h,
                color: const Color(0xffe2e2e2),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.w, 0.h,180.w,0.45.h),
                    child: Text(
                      'Product Detail',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.125.h,
                        color: const Color(0xff181725),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.w, 0.45.h,0.w, 0.h),
                    child: const Icon(
                      Icons.chevron_right_outlined,
                      size: 28,
                    )
                  )
                ],
              ),
              Divider(
                thickness: 2,
                endIndent: 24,
                height: 20.h,
                color: const Color(0xffe2e2e2),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.w, 0.h,190.w,0.45.h),
                    child: Text(
                      'Composition',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.125.h,
                        color: const Color(0xff181725),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0.w, 0.45.h,0.w, 0.h),
                      child: const Icon(
                        Icons.chevron_right_outlined,
                        size: 28,
                      )
                  )
                ],
              ),
              Divider(
                thickness: 2,
                endIndent: 24,
                height: 20.h,
                color: const Color(0xffe2e2e2),
              ),
              Container(
                  width:  300.w,
                  height: 67.h,
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
                      )
                  )
              ),
            ],
          ),
        );
      }
    );
  }
}
