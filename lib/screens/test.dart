import 'package:flutter/material.dart';
import 'package:petshop/models/User.dart';
import '../repository/user.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Future<List<User>> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: fetchUser(),
        builder:
            (BuildContext context, AsyncSnapshot<List<User>> items) {
          if (items.hasData) {
            List<User>? users = items.data?.take(10).toList();
            for(User pet in users!)
              print(pet.username);
          } else if (items.hasError) {
            return Text('${items.error}');
          }
          return const CircularProgressIndicator();
        });
  }
}
