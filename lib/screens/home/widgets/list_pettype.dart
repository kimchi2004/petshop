import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class pettypeList extends StatelessWidget {
  const pettypeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          0, 630, double.minPositive, double.minPositive),
      margin: const EdgeInsets.all(25),
      child: SizedBox(
        width: 550,
        height: 81,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                padding: const EdgeInsets.fromLTRB(13, 5, 35.45, 0),
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0x26f8a44c),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 14.55, 0),
                      width: 76,
                      height: 70,
                      child: const Image(
                        image: AssetImage('assets/images/dog1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: const Text(
                        'Dog',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.2575,
                          color: Color(0xff3e423f),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // riceQ4b (1:16)
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                width: 173,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0x2653b175),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Stack(
                  children: const [
                    Positioned(
                      left: 104.1569824219,
                      top: 30.8571472168,
                      child: Align(
                        child: SizedBox(
                          width: 28,
                          height: 26,
                          child: Text(
                            'Cat',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.2575,
                              color: Color(0xff3d413f),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Align(
                        child: SizedBox(
                          width: 173,
                          height: 81,
                          child: Image(
                            image: AssetImage('assets/images/cat1.jpg'),
                            width: 173,
                            height: 70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(19.55, 12.26, 40.84, 14.1),
                width: 173,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0x26535cb1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: const Image(
                          image: AssetImage('assets/images/rice.jpg'),
                          fit: BoxFit.cover,
                        )),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 8.55, 0, 0),
                      child: const Text(
                        'Rice',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.2575,
                          color: Color(0xff3d413f),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}