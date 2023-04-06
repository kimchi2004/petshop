import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/pet.dart';
import '../../../repository/pet.dart';

class ProductOrderInfo extends StatefulWidget {
  late int id;

  ProductOrderInfo({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductOrderInfo> createState() => _ProductOrderInfoState();
}

class _ProductOrderInfoState extends State<ProductOrderInfo> {
  late Future<List<Pet>> _petFuture;

  @override
  void initState() {
    super.initState();
    _petFuture = fetchPetid(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return FutureBuilder<List<Pet>>(
              future: _petFuture,
              builder: (BuildContext context, AsyncSnapshot<List<Pet>> items) {
                if (items.hasData) {
                  List<Pet>? pets = items.data;
                  return Container(
                    padding: EdgeInsets.fromLTRB(0.w, 405.h, 0.w, 0.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      15.w, 0.h, 38.w, 0.45.h),
                                  child: Text(
                                    'Repeat Order',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.125.h,
                                      color: const Color(0xff181725),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0.w, 0.45.h, 7.w, 0.h),
                                  child: Text(
                                    'Calculate',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      height: 1.125.h,
                                      decoration: TextDecoration.underline,
                                      color: const Color(0xffff7322),
                                      decorationColor: const Color(0xffff7322),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(14.w, 12.h, 10.w, 12.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffe2e2e2),
                                ),
                                color: const Color(0x33ffffff),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'No thanks',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      height: 1.29.h,
                                      color: const Color(0xff181725),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down_sharp,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 0.h),
                          child: Divider(
                            thickness: 2,
                            endIndent: 24,
                            height: 10.h,
                            color: const Color(0xffe2e2e2),
                          ),
                        ),
                        ExpansionTile(
                          title: Text(
                            'Product Detail',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.125.h,
                              color: const Color(0xff181725),
                            ),
                          ),
                          children: <Widget>[
                            for(Pet pet in pets!)
                              if(pet.id == widget.id)
                            ListTile(
                                title: Container(
                                  padding: EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 0.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: ${pet.name ?? ""}'),
                                      Text('Tag: ${pet.tags?.join("-") ?? ""}'),
                                      Text('Category: ${pet.category?.name ?? ""}')
                                    ],
                                  ),
                                )),
                                
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 0.h),
                          child: Divider(
                            thickness: 2,
                            endIndent: 24,
                            height: 10.h,
                            color: const Color(0xffe2e2e2),
                          ),
                        ),
                        ExpansionTile(
                          title: Text(
                            'Composition',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.125.h,
                              color: const Color(0xff181725),
                            ),
                          ),
                          children: const <Widget>[
                            ListTile(title: Text('This is tile number 1')),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 0.h),
                          child: Divider(
                            thickness: 2,
                            endIndent: 24,
                            height: 15.h,
                            color: const Color(0xffe2e2e2),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (items.hasError) {
                  return Text('Error: ${items.error}');
                } else {
                  return Transform.scale(
                      scaleX: 0.1,
                      scaleY: 0.05,
                      child: const CircularProgressIndicator());
                }
              });
        });
  }
}
