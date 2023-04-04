import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/home/home_screen.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  bool isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                color: Colors.black,
                icon: const Icon(Icons.chevron_left),
                padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.w, 0.h),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 20.w, 0.h),
                  child: InkWell(
                    onTap: _toggleFavorite,
                    child: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? Colors.red : Colors.black,
                    ),
                  ),
                )
              ]),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(80.w, 0.h, 0.w, 0.h),
                height: 200.h,
                child: const Image(
                  image: AssetImage('assets/images/product.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  //pagination
                  ),
              Row(
                children: [
                  Container(
                    width: 240.w,
                    margin: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 10.h),
                    child: Text(
                      'Symply Dog Adult Chicken With Rice & Vegetables',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.4.h,
                        letterSpacing: 0.1,
                        color: const Color(0xff181725),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                    child: Text(
                      '£1.99',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.75.h,
                          letterSpacing: 0.1,
                          color: const Color(0xff181725)),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.w, 0.h),
                child: Text(
                  '395g',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.125.h,
                    color: const Color(0xff7c7c7c),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
