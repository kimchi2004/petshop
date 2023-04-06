import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/pet.dart';
import '../../../repository/category.dart';

// ignore: camel_case_types
class pettypeList extends StatefulWidget {
  const pettypeList({
    super.key,
  });

  @override
  State<pettypeList> createState() => _pettypeListState();
}

// ignore: camel_case_types
class _pettypeListState extends State<pettypeList> {
  late Future<List<Pet>> futureCategory;

  @override
  void initState() {
    super.initState();
    futureCategory = fetchCategorty();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding:  EdgeInsets.fromLTRB(10.w, 467.h, 25.w, 0.h),
          child: FutureBuilder<List<Pet>>(
              future: fetchCategorty(),
              builder: (BuildContext context, AsyncSnapshot<List<Pet>> items) {
                if (items.hasData) {
                  List<Pet>? categories = items.data;
                  return SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (Pet item in categories!)
                            Container(
                              padding: EdgeInsets.fromLTRB(13.w, 5.h, 24.w, 0.h),
                              margin: REdgeInsets.fromLTRB(0.w, 0.h, 10.w, 0.h),
                              decoration: BoxDecoration(
                                color: const Color(0x26f8a44c),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0.w, 0.h, 14.55.w, 0.h),
                                    width: 76.w,
                                    height: 70.h,
                                    child: const Image(
                                      image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 8.h),
                                    child: Text(
                                      item.category?.name ?? "",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2575.h,
                                        color: const Color(0xff3e423f),
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
                } else if (items.hasError) {
                  return Text('${items.error}');
                }
                return Transform.scale(
                    scaleX: 0.1,
                    scaleY: 0.15,
                    child: const CircularProgressIndicator()
                );
              }),
        );
      }
    );
  }
}
