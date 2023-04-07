import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.fromLTRB(3.w, 42.h, 29.w, 58.h),
          decoration: const BoxDecoration(
            color: Color(0xfffbfbfb),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50.w, 0.h, 0.w, 94.h),
                height: 250.h,
                width: 300.w,
                child: Stack(
                  children: [
                    Image(
                        image: const AssetImage('assets/images/banner.jpg'),
                      width: 200.w,
                      height: 171.h,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(32.w, 127.h, 0.w, 0.h),
                      child: SizedBox(
                        width: 200.w,
                        height: 30.h,
                        child: Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.2175.h,
                            color: const Color(0xff252525)
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(26.w, 161.h, 0.w, 0.h),
                      child: SizedBox(
                        width: 300.w,
                        height: 20.h,
                        child: Text(
                          'sign in to access your account',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            height: 1.2175.h,
                            color: const Color(0xff252525),
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
