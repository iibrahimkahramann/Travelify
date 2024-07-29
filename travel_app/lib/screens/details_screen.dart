import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> itemData;

  DetailScreen({required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemData['title']),
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              itemData['image'],
              fit: BoxFit.cover,
              width: double.infinity,
              height: 30.h,
            ),
            SizedBox(height: 2.h),
            Text(
              itemData['title'],
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              itemData['distance'],
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
