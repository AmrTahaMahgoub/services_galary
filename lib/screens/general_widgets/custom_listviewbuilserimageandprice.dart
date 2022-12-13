import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListViewImageDataAndPrice extends StatelessWidget {
  const CustomListViewImageDataAndPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //padding: EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(2).r,
        height: 0,
        width: 100.w,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('world'), Text('256 EG')],
            ),
          ],
        ),
      ),
    );
  }
}
