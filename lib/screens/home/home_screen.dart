import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/home/widgets/bander.dart';
import 'package:petshop/screens/home/widgets/list_trending.dart';
import 'package:petshop/screens/home/widgets/list_browse.dart';
import 'package:petshop/screens/home/widgets/list_pettype.dart';
import 'package:petshop/screens/home/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    const seachWidget(),
                    const banderWidget(),
                    StatusTrending(),
                    const listTrend(),
                    BrowseStatus(),
                    const pettypeList(),
                    const browseList2(),
                    //bottom(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Positioned bottom() {
  //   return Positioned(
  //     left: 139.7062988281,
  //     top: 853,
  //     child: Align(
  //       child: SizedBox(
  //         width: 134.w,
  //         height: 5.h,
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(100),
  //             border: Border.all(color: const Color(0xffe6e6e6)),
  //             color: Colors.grey,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Container BrowseStatus() {
    return Container(
      padding:  EdgeInsets.fromLTRB(24.7062988281.w, 497.h, 34.29.w, 0.h),
      child: SizedBox(
        width: 378.w,
        height: 31.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.w, 0.h, 57.w, 0.h),
              child: Text(
                'Browse pet types',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.2575.h,
                  color: const Color(0xff1d1d1b),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 1.h),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.2575.h,
                  color: const Color(0xffff7322),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container StatusTrending() {
    return Container(
      padding: EdgeInsets.fromLTRB(
          24.7062988281.w, 207.h, 34.29.w, 0.h),
      child: SizedBox(
        width: 378,
        height: 41,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:  EdgeInsets.fromLTRB(0.w, 0.h, 90.w, 0.h),
              child: Text(
                'Trending now',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.2575.h,
                  color: const Color(0xff181725),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.w, 0.h, 0.w, double.minPositive),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.2575.h,
                  color: const Color(0xffff7322),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}