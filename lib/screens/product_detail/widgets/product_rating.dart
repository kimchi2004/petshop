import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRating extends StatefulWidget {
  final int maxRating;
  const ProductRating({super.key, this.maxRating = 5});

  @override
  // ignore: library_private_types_in_public_api
  _ProductRatingState createState() => _ProductRatingState();
}

class _ProductRatingState extends State<ProductRating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index <= _currentRating) {
      return const Icon(Icons.star, color: Colors.deepOrange);
    } else {
      return const Icon(Icons.star_border, color: Colors.deepOrange);
    }
  }

  Widget _buildStarRow() {
    List<Widget> stars = [];
    for (int i = 1; i <= widget.maxRating; i++) {
      stars.add(GestureDetector(
        onTap: () {
          setState(() {
            _currentRating = i;
          });
        },
        child: _buildRatingStar(i),
      ));
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 0.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start, 
          children: stars
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return _buildStarRow();
        });
  }
}
