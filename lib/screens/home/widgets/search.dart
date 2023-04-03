import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class seachWidget extends StatelessWidget {
  const seachWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.fromLTRB(10.w, 20.h, 0.w, 0.h),
          child: SizedBox(
            width: 414.w,
            height: 52.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.w, 1.9.h, 22.w, 0.h),
                  width: 45.w,
                  height: 31.9.h,
                  child: Image(
                    image: AssetImage('assets/images/logo.jpg'),
                    width: 45.w,
                    height: 31.9.h,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.w, 15.h, 21.21.w, 10.h),
                  width: 273.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: const Color(0xfff1f2f2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SizedBox(
                    width: 177.36.w,
                    height: 0.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0.w, 1.57.h, 15.97.w, 0.h),
                          width: 18.39.w,
                          height: 18.21.h,
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Search Product or Brand',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.2575.h,
                            color: const Color(0xff7c7c7c),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}