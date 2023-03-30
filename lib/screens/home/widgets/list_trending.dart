import 'package:flutter/material.dart';
import 'package:petshop/repository/pet.dart';
import '../../../models/pet.dart';

// ignore: camel_case_types
class listTrend extends StatefulWidget {
  const listTrend({super.key});

  @override
  State<listTrend> createState() => _listTrendState();
}

class _listTrendState extends State<listTrend> {
  late Future<List<Pet>> futurePet;

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
      child: FutureBuilder<List<Pet>>(
          future: fetchPet(),
          builder: (BuildContext context, AsyncSnapshot<List<Pet>> items) {
            if (items.hasData) {
              List<Pet>? pets = items.data;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  for (Pet item in pets!)
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
                              child: Image.network(
                                (item.photoUrls?.isNotEmpty ?? false)
                                    ? (Uri.parse(item.photoUrls![0])
                                                .isAbsolute ==
                                            true
                                        ? item.photoUrls![0]
                                        : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png")
                                    : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            item.name ?? "",
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
                            child: Text(
                              item.tags?.join("-") ?? "",
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
            } else if (items.hasError) {
              return Text('${items.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
