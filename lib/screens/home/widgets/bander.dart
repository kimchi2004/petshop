import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class banderWidget extends StatelessWidget {
  const banderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child){
        return Container(
          padding: const EdgeInsets.fromLTRB(24.71, 140, 22.29, double.minPositive),
          child: Stack(
            children: [
              Positioned(
                child: ClipRect(
                  child: Container(
                    width: 367.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(180.29, 37, 30, 40.17),
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
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                'Canagan Dental',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2575,
                                  color: const Color(0xff030303),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Get Up To 40% OFF',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.sp,
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
              Positioned(
                left: -15,
                top: -25,
                child: Align(
                  child: SizedBox(
                    width: 367.w,
                    height: 148.h,
                    child: const Image(
                      image: AssetImage(
                        'assets/images/bg1.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}