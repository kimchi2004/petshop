import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../models/User.dart';
import 'package:http/http.dart' as http;
import '../../../home/home_screen.dart';
import '../../register/register.dart';

class InputComponent extends StatefulWidget {
  final Function(String, String) onLogin;
  const InputComponent({Key? key, required this.onLogin}) : super(key: key);

  @override
  State<InputComponent> createState() => _InputState();
}

class _InputState extends State<InputComponent> {
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late List<User> _userList;
  late User _selectedUser;
  late bool _rememberMe;
  bool _showTextFormField = false;

  @override
  void initState() {
    super.initState();
    _userList = [];
    _selectedUser = User(email: '', password: '');
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _rememberMe = false;
    _loadSavedUsers();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final userListJson = prefs.getStringList('userList') ?? [];
    final List<User> userList = userListJson
        .map((userJson) => User.fromJson(json.decode(userJson)))
        .toList();
    setState(() {
      _userList = userList;
    });
  }

  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      _userList.add(_selectedUser);
      _userList = _removeDuplicateUsers(_userList);
      final userListJson = _userList
          .map((user) => json.encode(user.toJson()))
          .toList();
      prefs.setStringList('userList', userListJson);
    } else {
      prefs.remove('userList');
    }
  }

  List<DropdownMenuItem<User>> _getUserDropdownItems(List<User> users) {
    Set<User> uniqueUsers = Set<User>.from(users);
    List<DropdownMenuItem<User>> items = uniqueUsers.map((user) {
      return DropdownMenuItem<User>(
        value: user,
        child: Text(user.username ?? ''),
      );
    }).toList();
    return items;
  }


  Future<bool> _login(String username, String password) async {
    setState(() {
    });

    final response = await http.get(
      Uri.parse('https://petstore.swagger.io/v2/user/login?username=$username&password=$password'),
    );

    setState(() {
    });

    if (response.statusCode == 200) {
      _saveToken(response.body);
      setState(() {
      });
      return true;
    } else {
      return false;
    }
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  void _handleLogin() {
    _fillToBox();
    _saveCredentials();
    if (_formKey.currentState!.validate()) {
      setState(() {
      });
      _login(_usernameController.text, _passwordController.text)
          .then((success) {
        setState(() {
        });
        if (success) {
          _saveToken('token').then((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()),
            );
          });
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Login Failed'),
                  content: const Text('Please check your credentials and try again.'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
        }
      });
    }
  }

  // void _onLoginPressed() {
  //   _fillToBox();
  //   _saveCredentials();
  //     if (_formKey.currentState!.validate()) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (BuildContext context) => const HomeScreen(),),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Login failed!')),
  //       );
  //     }
  // }

  List<User> _removeDuplicateUsers(List<User> userList) {
    List<User> uniqueUsers = [];
    Set<String> uniqueUsernames = {};
    for (var user in userList) {
      if (!uniqueUsernames.contains(user.username)) {
        uniqueUsers.add(user);
        uniqueUsernames.add(user.username ?? '');
      }
    }
    return uniqueUsers;
  }

  // Future<void> deleteAllUsers() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove('userList');
  // }

  void _fillToBox() {
    _selectedUser.username = _usernameController.text;
    _selectedUser.password = _passwordController.text;
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
                      Row(
                        children: [
                          if(_showTextFormField == false)
                            Container(
                              width: 270.w,
                              height: 50.h,
                              child: DropdownButtonFormField<User>(
                                items: _getUserDropdownItems(_userList),
                                hint: const Text('Select an account'),
                                value: _selectedUser.username?.isNotEmpty == true
                                    ? _selectedUser
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedUser = value!;
                                    _showTextFormField = false;
                                    _usernameController.text =
                                        _selectedUser.username ?? '';
                                    _passwordController.text =
                                        _selectedUser.password ?? '';
                                    _rememberMe = true;
                                    _showTextFormField=false;
                                  });
                                },
                              ),
                            ),
                          if(_showTextFormField == false)
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                _showTextFormField = true;
                              });
                            },
                          ),
                        ],
                      ),
                      if (_showTextFormField)
                        Container(
                          width: 400.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: const Color(0x33c4c4c4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
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
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
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
                        onTap: _handleLogin,
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