import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/Authentication/register/widgets/banner.dart';
import 'package:petshop/screens/Authentication/register/widgets/input.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  children: const [
                    BannerRegister(),
                    InputInfo(),
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
}
