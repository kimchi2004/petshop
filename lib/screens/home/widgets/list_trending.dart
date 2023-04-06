import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petshop/repository/pet.dart';
import 'package:petshop/screens/product_detail/productdetail_screen.dart';
import '../../../models/pet.dart';

// ignore: camel_case_types
class listTrend extends StatefulWidget {
  const listTrend({super.key});

  @override
  State<listTrend> createState() => _listTrendState();
}

// ignore: camel_case_types
class _listTrendState extends State<listTrend> {
  late Future<List<Pet>> futurePet;

  @override
  void initState() {
    super.initState();
    futurePet = fetchPet();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.fromLTRB(10.w, 50.h, 0.w, double.minPositive),
          child: FutureBuilder<List<Pet>>(
              builder: (BuildContext context, AsyncSnapshot<List<Pet>> items) {
                if (items.hasData) {
                  List<Pet>? pets = items.data;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      for (Pet item in pets!)
                        GestureDetector(
                          onTap: () async{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            ProductDetail(petId: item.id!)),
                      );
                    },
                          child: Container(
                            width: 148.w,
                            height: 230.h,
                            margin: EdgeInsets.all(5.h),
                            child: Card(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0.h),
                                constraints: BoxConstraints(
                                  maxWidth: 148.w,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 10.h),
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
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1.125.h,
                                        letterSpacing: 0.1000000015,
                                        color: const Color(0xff1d1d1b),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0.w, 5.h, 0.w, 0.h),
                                      child: Text(
                                        item.tags?.join("-") ?? "",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 1.2857142857.h,
                                          color: const Color(0xff7c7c7c),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
    );
  }
}
