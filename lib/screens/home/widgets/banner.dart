import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bannerWidget extends StatelessWidget {
  const bannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child){
        return Container(
          padding: EdgeInsets.fromLTRB(10.w, 42.h, 10.w, 0.h),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0.w, 42.h, 0.w, 0.h),
                child: ClipRect(
                  child: Container(
                    width: 367.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(180.29.w, 37.h, 30.w, 40.17.h),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xfff2f3f2)),
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          begin: Alignment(-0.974, -0.939),
                          end: Alignment(0.977, 1.009),
                          colors: <Color>[Color(0xff6dc298), Color(0xff23bda8)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                              child: Text(
                                'Canagan Dental',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2575.h,
                                  color: const Color(0xff030303),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Get Up To 40% OFF',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.w, 19.h, 0.w, 0.h),
                child: Image(
                  image: const AssetImage(
                    'assets/images/bg1.jpg',
                  ),
                  width: 350.w,
                  height: 148.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}