import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class seachWidget extends StatelessWidget {
  const seachWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 47, 0, 0),
      //margin: const EdgeInsets.all(25),
      child: SizedBox(
        width: 414.w,
        height: 52.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 1.9, 22, 0),
              width: 45.w,
              height: 31.9.h,
              child: Image(
                image: const AssetImage('assets/images/logo.jpg'),
                width: 45.w,
                height: 31.9.h,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 15, 21.21, 10),
              width: 273.w,
              height: 52.h,
              decoration: BoxDecoration(
                color: const Color(0xfff1f2f2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: SizedBox(
                width: 177.36.w,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          0, 1.57, 15.97, double.minPositive),
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
}