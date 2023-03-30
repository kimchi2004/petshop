import 'package:flutter/material.dart';
import 'package:petshop/repository/pet.dart';
import '../../../models/pet.dart';

class listTrend extends StatefulWidget {
  const listTrend({super.key});

  @override
  State<listTrend> createState() => _listTrendState();
}

class _listTrendState extends State<listTrend> {
  late Future<Pet> futurePet;

  @override
  void initState() {
    super.initState();
    futurePet = fetchPet();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 337, 0, double.minPositive),
      margin: const EdgeInsets.all(25),
      child: FutureBuilder<Pet>(
          future: futurePet,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                    constraints: const BoxConstraints(
                      maxWidth: 148,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image: AssetImage(snapshot.data!.photoUrls),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          snapshot.data!.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.125,
                            letterSpacing: 0.1000000015,
                            color: Color(0xff1d1d1b),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 105, 0),
                          child:  Text(
                            snapshot.data!.status,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.2857142857,
                              color: Color(0xff7c7c7c),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              );
            }
            else if (snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
