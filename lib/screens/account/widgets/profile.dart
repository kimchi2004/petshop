import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _username = '';
  String _name = '';
  String _surname = '';

  @override
  void initState() {
    super.initState();
    _getAccountInfo();
  }

  Future<String> _retrieveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<String> _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  Future<void> _getAccountInfo() async {
    String token = await _retrieveToken();
    String username = await _getUsername();
    if (token.isNotEmpty) {
      String apiUrl = 'https://petstore.swagger.io/v2/user/$username';
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
      };
      http.Response response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.body);
        setState(() {
          _username = '${userData['username']}';
          _name = '${userData['firstName']}';
          _surname='${userData['lastName']}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return Container(
            padding: EdgeInsets.fromLTRB(20.w,20.h, 20.w, 0.h),
            child:
            SizedBox(
              width:  342.w,
              height:  376.h,
              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children:  [
                  Container(
                    margin:  EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 15.h),
                    child: Container(
                      margin:  EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                      child:
                      Text(
                        'My Account',
                        style:  TextStyle (
                          fontSize:  34.sp,
                          fontWeight:  FontWeight.w700,
                          letterSpacing:  0.25,
                          color:  Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 15.h),
                    width:  double.infinity,
                    child: Container(
                      margin:  EdgeInsets.fromLTRB(0.w, 0.h, 161.w, 0.h),
                      child:
                      Text(
                        'PROFILE',
                        style:  TextStyle (
                          fontSize:  16.sp,
                          fontWeight:  FontWeight.w400,
                          height:  1.4285714286.h,
                          letterSpacing:  0.25,
                          color:  Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.fromLTRB(16.w, 14.h, 0.w, 11.h),
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
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          margin:  EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 11.h),
                          padding:  EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                          width:  double.infinity,
                          child:
                          Text(
                            'Username: $_username',
                            style:  TextStyle (
                              fontSize:  16.sp,
                              fontWeight:  FontWeight.w400,
                              height:  1.4285714286.h,
                              letterSpacing:  0.25,
                              color:  Colors.grey,
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
                            Text(
                              'Name: $_name',
                              style:  TextStyle (
                                fontSize:  16.sp,
                                fontWeight:  FontWeight.w400,
                                height:  1.4285714286.h,
                                letterSpacing:  0.25,
                                color:  Colors.grey,
                              ),
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
                          child:
                          Container(
                            margin:  EdgeInsets.fromLTRB(0.w, 0.h, 153.w, 0.h),
                            child:
                            Text(
                              'Surname: $_surname',
                              style:  TextStyle (
                                fontSize:  16.sp,
                                fontWeight:  FontWeight.w400,
                                height:  1.4285714286.h,
                                letterSpacing:  0.25,
                                color:  Colors.grey,
                              ),
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
                          child:
                          Text(
                            'Email: $_username',
                            style:  TextStyle (
                              fontSize:  16.sp,
                              fontWeight:  FontWeight.w400,
                              height:  1.4285714286.h,
                              letterSpacing:  0.25,
                              color:  Colors.grey,
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
                          child:
                          Text(
                            'Address: Huế',
                            style:  TextStyle (
                              fontSize:  16.sp,
                              fontWeight:  FontWeight.w400,
                              height:  1.4285714286.h,
                              letterSpacing:  0.25,
                              color:  Colors.grey,
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
