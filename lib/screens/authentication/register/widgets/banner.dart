import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerRegister extends StatefulWidget {
  const BannerRegister({Key? key}) : super(key: key);

  @override
  State<BannerRegister> createState() => _BannerRegisterState();
}

class _BannerRegisterState extends State<BannerRegister> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: EdgeInsets.fromLTRB(0.w, 42.h, 29.w, 58.h),
            decoration: const BoxDecoration(
              color: Color(0xfffbfbfb),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(70.w, 0.h, 0.w, 94.h),
                  width: 300.w,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 200.w,
                        height: 171.h,
                        child: const Image(
                          image: AssetImage('assets/images/banner.jpg'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0.w, 124.h, 0.w, 0.h),
                        child: Align(
                          child: SizedBox(
                            width: 200.w,
                            height: 40.h,
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                  fontSize: 27.sp,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2175.h,
                                  color: const Color(0xff252525)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(26.w, 165.h, 0.w, 0.h),
                        child: Align(
                          child: SizedBox(
                            width: 300.w,
                            height: 20.h,
                            child: Text(
                              'by creating a free account',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                height: 1.h,
                                color: const Color(0xff252525),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
