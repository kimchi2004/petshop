import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/account/widgets/profile.dart';
import 'package:petshop/screens/account/widgets/settings.dart';
import 'package:petshop/screens/home/home_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                    MaterialPageRoute(
                        builder: (context) => const  HomeScreen()),
                  );
                },
                color: Colors.black,
                icon: const Icon(Icons.keyboard_backspace),
                padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.w, 0.h),
              ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children:const [
                    Profile(),
                    SettingsWidget(),
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
