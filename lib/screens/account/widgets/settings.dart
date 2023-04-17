import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/Authentication/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

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
      });
    }
  }

  Future<void> _deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  void _handleLogout() async {
    await _deleteToken(); // delete token from storage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    ); // navigate to login screen
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.fromLTRB(20.w, 400.h, 20.w, 0.h),
          child:
          SizedBox(
            width:  342.w,
            height:  376.h,
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  margin:  EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 15.h),
                  width:  double.infinity,
                  child: Container(
                    margin:  EdgeInsets.fromLTRB(0.w, 0.h, 161.w, 0.h),
                    child:
                    Text(
                      'SETTINGS',
                      style:  TextStyle (
                        fontSize:  16.sp,
                        fontWeight:  FontWeight.w400,
                        height:  1.4285714286,
                        letterSpacing:  0.25,
                        color:  Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:  EdgeInsets.fromLTRB(16.w, 14.h, 24.w, 11.h),
                  width:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Colors.white,
                    borderRadius:  BorderRadius.circular(15),
                    boxShadow:  const [
                      BoxShadow(
                        color:  Colors.transparent,
                        offset:  Offset(0, 1),
                        blurRadius:  2,
                      ),
                    ],
                  ),
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        margin:  EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 11.h),
                        padding:  EdgeInsets.fromLTRB(0.w, 0.h, 117.w, 0.h),
                        width:  double.infinity,
                        child:
                        Text(
                          'Appearance',
                          style:  TextStyle (
                            fontSize:  16.sp,
                            fontWeight:  FontWeight.w400,
                            height:  1.4285714286.h,
                            letterSpacing:  0.25,
                            color:  Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                        child: Divider(
                          thickness: 2,
                          endIndent: 0,
                          height: 10.h,
                          color: Colors.grey[300],
                        ),
                      ),
                      Container(
                        margin:  EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 13.h),
                        width:  double.infinity,
                        child: Container(
                          margin:  EdgeInsets.fromLTRB(0.w, 0.h, 161.w, 0.h),
                          child:
                          ElevatedButton(
                            onPressed: _handleLogout,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              ),
                           child: Text(
                             'Logout',
                             style:  TextStyle (
                               fontSize:  16.sp,
                               fontWeight:  FontWeight.w400,
                               height:  1.4285714286.h,
                               letterSpacing:  0.25,
                               color:  Colors.blue,
                             ),
                           )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
