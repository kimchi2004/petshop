import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/Authentication/login/login.dart';
import 'package:petshop/screens/home/widgets/banner.dart';
import 'package:petshop/screens/home/widgets/list_trending.dart';
import 'package:petshop/screens/home/widgets/list_browse.dart';
import 'package:petshop/screens/home/widgets/list_pettype.dart';
import 'package:petshop/screens/home/widgets/search.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  bool _isLoading = false;
  String _token = '';

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    if (token.isNotEmpty) {
      setState(() {
        _token = token;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _token.isNotEmpty
                ? Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const seachWidget(),
                      const bannerWidget(),
                      StatusTrending(),
                      const listTrend(),
                      BrowseStatus(),
                      const pettypeList(),
                      const browseList2(),
                    ],
                  ),
                ],
              ),
            ): const Login(),
          )
        );
      },
    );
  }

  Container BrowseStatus() {
    return Container(
      padding:  EdgeInsets.fromLTRB(10.w, 497.h, 34.29.w, 0.h),
      child: SizedBox(
        width: 378.w,
        height: 31.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.w, 0.h, 97.w, 0.h),
              child: Text(
                'Browse pet types',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
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
                  fontSize: 14.sp,
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
          10.w, 212.h, 34.29.w, 0.h),
      child: SizedBox(
        width: 378.w,
        height: 41.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:  EdgeInsets.fromLTRB(0.w, 0.h, 130.w, 0.h),
              child: Text(
                'Trending now',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
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
                  fontSize: 14.sp,
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