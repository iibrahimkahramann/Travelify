import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> itemData;

  DetailScreen({required this.itemData});

  final List<Map<String, dynamic>> flightData = [
    {
      'image': 'assets/images/thy.png',
      'airline': 'Turkish Airlines',
      'price': 150.0,
      'date': DateTime(2024, 8, 10),
    },
    {
      'image': 'assets/images/pegasus.png',
      'airline': 'Pegasus Airlines',
      'price': 200.0,
      'date': DateTime(2024, 8, 15),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 23.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                itemData['image'],
                fit: BoxFit.cover,
              ),
              title: Text(
                itemData['title'],
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              centerTitle: false,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              DetailTitle(itemData: itemData),
              Container(
                color: Color.fromARGB(255, 245, 244, 244),
                height: 2.h,
              ),
              InformationWidget(),
              Container(
                color: Color.fromARGB(255, 245, 244, 244),
                height: 2.h,
              ),
              MapWidget(),
              Container(
                color: Color.fromARGB(255, 245, 244, 244),
                height: 2.h,
              ),
              CommentsWidget(),
              Container(
                color: Color.fromARGB(255, 245, 244, 244),
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.airplane_ticket_rounded,
                          size: 22.sp,
                          color: Color.fromARGB(255, 115, 115, 115),
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          'Flights within 30 Days',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Color.fromARGB(255, 115, 115, 115),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Konum
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0), // İçerik padding
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/thy.png'),
                                radius: 14.sp,
                              ),
                            ),
                            SizedBox(width: 8.sp),
                            Text(
                              'Turkish Airlines',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(width: 22.w),
                            Text(
                              'Buy',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: Color.fromARGB(255, 149, 149, 149),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 11.sp,
                              color: Color.fromARGB(255, 115, 115, 115),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.message,
                size: 22.sp,
                color: Color.fromARGB(255, 115, 115, 115),
              ),
              SizedBox(width: 1.w),
              Text(
                'Comments 85',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Color.fromARGB(255, 115, 115, 115),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                  radius: 14.sp,
                ),
              ),
              SizedBox(width: 8.sp),
              Text(
                'Mert Demir',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '4 days ago',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                    color: Color.fromARGB(255, 149, 149, 149)),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 25.0),
            child: Text(
              'It is a place everyone should visit and see. But I couldnt find any delicious food there.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10.sp,
                color: Color.fromARGB(255, 149, 149, 149),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                  radius: 14.sp,
                ),
              ),
              SizedBox(width: 8.sp),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Add a comment...',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 180, 180, 180),
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Container(
            color: Color.fromARGB(255, 235, 235, 235),
            height: 2,
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.map_sharp,
                size: 22.sp,
                color: Color.fromARGB(255, 115, 115, 115),
              ),
              SizedBox(width: 1.w),
              Text(
                'See on Map',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Color.fromARGB(255, 115, 115, 115),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
        ],
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_rounded,
                size: 22.sp,
                color: Color.fromARGB(255, 115, 115, 115),
              ),
              SizedBox(width: 1.w),
              Text(
                'Information',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Color.fromARGB(255, 115, 115, 115),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.w),
            child: Text(
              'Famed archaeological site featuring the Great Pyramids, the Great Sphinx & other well-known ruins. Read More',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailTitle extends StatelessWidget {
  const DetailTitle({
    super.key,
    required this.itemData,
  });

  final Map<String, dynamic> itemData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemData['title'],
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16.sp,
                color: Color.fromARGB(255, 115, 115, 115),
              ),
              SizedBox(width: 1.w),
              Text(
                itemData['location'],
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromARGB(255, 115, 115, 115),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
