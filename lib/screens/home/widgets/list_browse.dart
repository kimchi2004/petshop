import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/account/account_screen.dart';

// ignore: camel_case_types
class browseList2 extends StatelessWidget {
  const browseList2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.fromLTRB(0.w, 645.h, 0.w,0.h),
          child: Container(
            width: 414.w,
            height: 52.h,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x16545d58),
                  offset: Offset(2, -5),
                  blurRadius: 7.5,
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.w, 0.h, 10.w, 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0.w, 0.h, 10.w, 9.h),
                          width: 16.04.w,
                          height: 11.h,
                          child: const Icon(
                            Icons.storefront,
                          )),
                      Text(
                        'Shop',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.2575.h,
                          color: const Color(0xff181725),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(110.w, 0.h, 10.w, 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0.w, 0.h, 10.w, 9.h),
                          width: 16.04.w,
                          height: 11.h,
                          child: const Icon(
                            Icons.manage_search_sharp,
                          )),
                      Text(
                        'Explore',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.2575.h,
                          color: const Color(0xff181725),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(210.w, 0.h, 10.w, 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0.w, 0.h, 10.w, 9.h),
                          width: 16.04.w,
                          height: 11.h,
                          child: const Icon(
                            Icons.favorite_border,
                          )),
                      Text(
                        'Favourite',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.2575.h,
                          color: const Color(0xff181725),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const AccountScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(300.w, 0.h, 10.w, 0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0.w, 0.h, 10.w, 0.h),
                            child: const Icon(
                              Icons.account_circle_outlined,
                            ),
                            ),
                        Text(
                          'Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.2575.h,
                            color: const Color(0xff181725),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}