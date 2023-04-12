import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/User.dart';
import '../../../home/home_screen.dart';
import '../../register/register.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final _user = User(username: '', password: '');

  @override
  void initState() {
    super.initState();
    _loadSaveCredentials();
  }

  Future<void> _loadSaveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMe = prefs.getBool('rememberMe') ?? false;
    if (rememberMe) {
      String username = prefs.getString('username') ?? '';
      String password = prefs.getString('password') ?? '';
      setState(() {
        _usernameController.text = username;
        _passwordController.text = password;
        _rememberMe = true;
      });
    }
  }

  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      await prefs.setString('username', _usernameController.text);
      await prefs.setString('password', _passwordController.text);
    } else {
      await prefs.remove('username');
      await prefs.remove('password');
    }
    await prefs.setBool('rememberMe', _rememberMe);
  }

  void _onRememberMeChanged(bool? value) {
    setState(() {
      _rememberMe = _rememberMe = value ?? false;
      ;
    });
  }

  void _onLoginPressed() {
    String email = _usernameController.text;
    String password = _passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      _saveCredentials();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('Please enter a valid email and password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

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
                  width: 400.w,
                  height: 500.h,
                  padding: EdgeInsets.fromLTRB(22.w, 280.h, 20.w, 15.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 400.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: const Color(0x33c4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) => _user.username = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter your username!';
                            }
                            return null;
                          },
                          controller: _usernameController,
                          decoration: const InputDecoration(
                              hintText: 'Username',
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
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: const Color(0x33c4c4c4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          onChanged: (value) => _user.password = value,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter your Password!';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              hintText: 'Password',
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
                      SizedBox(height: 16.0.h),
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: _onRememberMeChanged,
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.2575.h,
                              color: const Color(0xff252525),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Forget password',
                              style: TextStyle(
                                color: const Color(0xff6c63ff),
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.2575.h,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(22.w, 50.h, 20.w, 30.h),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _onLoginPressed,
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
                            'New Member? ',
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
                                    builder: (context) => const Register()),
                              );
                            },
                            child: Text(
                              'Register now',
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
