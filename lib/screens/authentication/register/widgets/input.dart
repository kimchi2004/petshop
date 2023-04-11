import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/User.dart';
import '../../../../repository/user.dart';
import '../../login/login.dart';

class InputInfo extends StatefulWidget {
  const InputInfo({Key? key}) : super(key: key);

  @override
  State<InputInfo> createState() => _InputInfoState();
}

class _InputInfoState extends State<InputInfo> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _validemailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? rememberMe = false;


  final _user = User(username: '',firstName: '',lastName: '', email: '', password: '', phone:'');

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(22.w, 250.h, 20.w, 15.h),
                  width: 400.w,
                  height: 562.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 400.w,
                        height: 49.h,
                        decoration: BoxDecoration(
                          color: const Color(0x33c4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            // Split the full name into its constituent parts
                            final parts = value.trim().split(' ');
                            if (parts.length == 2) {
                              _user.firstName = parts[0];
                              _user.lastName = parts[1];
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter Full name';
                            }
                            return null;
                          },
                          controller: _fullnameController,
                          decoration: const InputDecoration(
                              hintText: 'Full name',
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.all(20),
                              suffixIcon: Icon(Icons.person),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              ))),
                        ),
                      ),
                      SizedBox(height: 16.0.h),
                      Container(
                        width: 400.w,
                        height: 49.h,
                        decoration: BoxDecoration(
                          color: const Color(0x33c4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            _user.username = value;
                            _user.email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          controller: _validemailController,
                          decoration: const InputDecoration(
                              hintText: 'Valid email',
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.all(20),
                              suffixIcon: Icon(Icons.email_outlined),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              ))),
                        ),
                      ),
                      SizedBox(height: 16.0.h),
                      Container(
                        width: 400.w,
                        height: 49.h,
                        decoration: BoxDecoration(
                          color: const Color(0x33c4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) => _user.phone = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter Phone number';
                            }
                            return null;
                          },
                          controller: _phonenumberController,
                          decoration: const InputDecoration(
                              hintText: 'Phone number',
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.all(20),
                              suffixIcon: Icon(Icons.phone_android_sharp),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              ))),
                        ),
                      ),
                      SizedBox(height: 16.0.h),
                      Container(
                        width: 400.w,
                        height: 49.h,
                        decoration: BoxDecoration(
                          color: const Color(0x33c4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) => _user.password = value,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter Password';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              hintText: 'Strong Password',
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.all(20),
                              suffixIcon: Icon(Icons.lock_outline),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.transparent,
                              ))),
                        ),
                      ),
                      SizedBox(height: 10.0.h),
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe!,
                            onChanged: (bool? newValue) {
                              // accept a nullable boolean value
                              if (newValue != null) {
                                setState(() {
                                  rememberMe = newValue;
                                });
                              }
                            },
                          ),
                          Text(
                            'By checking the box you agree to our ',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.2575.h,
                              color: const Color(0xff252525),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Terms',
                              style: TextStyle(
                                color: const Color(0xff6c63ff),
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.2575.h,
                              ),
                            ),
                          ),
                          Text(
                            ' and ',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.2575.h,
                              color: const Color(0xff252525),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Conditions',
                              style: TextStyle(
                                color: const Color(0xff6c63ff),
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.2575.h,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(22.w, 20.h, 20.w, 10.h),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            bool usernameExists = await checkUsernameExists(_validemailController.text);

                            if (usernameExists) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Username already exists')),
                              );
                            } else {
                              await createUser(_user);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const Login()),
                              );
                            }
                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Register failed!')),
                            );
                          }
                        },
                        child: Container(
                            padding: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 15.h),
                            margin: EdgeInsets.fromLTRB(0.w, 0.h, 1.w, 23.h),
                            width: 350.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff6c63ff),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(100.w, 0.h, 100.w, 0.h),
                              margin: EdgeInsets.fromLTRB(0.w, 5.h, 11.w, 0.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2175.h,
                                      color: const Color(0xfffbfbfb),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(0.w, 5.h, 0.w, 0.h),
                                    child: const Icon(
                                      Icons.chevron_right,
                                      color: Color(0xfffbfbfb),
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(60.w, 0.h, 50.w, 0.h),
                        margin: EdgeInsets.fromLTRB(0.w, 0.h, 23.w, 0.h),
                        child: Row(children: [
                          Text(
                            'Already a member? ',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w300,
                              height: 1.2175.h,
                              color: const Color(0xff252525),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.2175.h,
                                color: const Color(0xff6c63ff),
                              ),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
