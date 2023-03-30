import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class browseList2 extends StatelessWidget {
  const browseList2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          0, 774, double.minPositive, double.minPositive),
      child: Container(
        width: 414,
        height: 92,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x16545d58),
              offset: Offset(2, -5),
              blurRadius: 7.5,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 30.7062988281,
              top: 17,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                width: 27,
                height: 43.17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // store1XUX (1:60)
                        margin: const EdgeInsets.fromLTRB(1, 0, 0, 5.17),
                        width: 20,
                        height: 20,
                        child: const Icon(
                          Icons.storefront,
                        )),
                    const Text(
                      'Shop',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1.2575,
                        color: Color(0xffff7322),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 121,
              top: 20,
              child: SizedBox(
                width: 38,
                height: 39.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(1, 0, 0, 5.24),
                        width: 28.35,
                        height: 18.21,
                        child: const Icon(
                          Icons.manage_search_sharp,
                        )),
                    const Text(
                      'Explore',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1.2575,
                        color: Color(0xff181725),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 224.5,
              top: 17,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 2.2, 0, 0),
                width: 48,
                height: 42.69,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.89),
                        width: 22.8,
                        height: 19.6,
                        child: const Icon(
                          Icons.favorite_border,
                        )),
                    const Text(
                      'Favourite',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1.2575,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 339,
              top: 17,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                width: 41,
                height: 43.17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 1, 5.17),
                        width: 16.04,
                        height: 20,
                        child: const Icon(
                          Icons.account_circle_outlined,
                        )),
                    const Text(
                      'Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1.2575,
                        color: Color(0xff181725),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}