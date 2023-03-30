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
                    const browseList(),
                    const browseList2(),
                    bottom(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Positioned bottom() {
    return Positioned(
      left: 139.7062988281,
      top: 853,
      child: Align(
        child: SizedBox(
          width: 134,
          height: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: const Color(0xffe6e6e6)),
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Container BrowseStatus() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          24.7062988281, 603, 34.29, double.minPositive),
      child: SizedBox(
        width: 378,
        height: 31,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 100, 0),
              child: const Text(
                'Browse pet types',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  height: 1.2575,
                  color: Color(0xff1d1d1b),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 1),
              child: const Text(
                'See all',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.2575,
                  color: Color(0xffff7322),
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
      padding: const EdgeInsets.fromLTRB(
          24.7062988281, 317, 34.29, double.minPositive),
      child: SizedBox(
        width: 378,
        height: 31,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 136, 0),
              child: const Text(
                'Trending now',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  height: 1.2575,
                  color: Color(0xff181725),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 0, double.minPositive),
              child: const Text(
                'See all',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.2575,
                  color: Color(0xffff7322),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}