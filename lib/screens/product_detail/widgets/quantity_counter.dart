import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({Key? key}) : super(key: key);

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.fromLTRB(15.w, 130.h, 0.w, 0.h),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    _quantity = _quantity > 1 ? _quantity - 1 : 1;
                  });
                },
              ),
              Container(
                  width:  35.w,
                  height: 35.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffe2e2e2),
                  ),
                  borderRadius:  BorderRadius.circular(17),
                ),
                  child: Center(
                      child: Text(
                          '$_quantity',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.h,
                          color: const Color(0xff181725),
                        ),
                      )
                  )
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
