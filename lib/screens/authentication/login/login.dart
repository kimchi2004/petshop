import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/screens/Authentication/login/widgets/banner.dart';
import 'package:petshop/screens/authentication/login/widgets/input.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
                  children: [
                    const BannerLogin(),
                    InputComponent(onLogin: _login,)
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
