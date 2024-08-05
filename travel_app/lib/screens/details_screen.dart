import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

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
              // "Flights within 30 Days" başlığı
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
                child: Row(
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
              ),
              // FlightCard widget'larını veri ile güncelleyin
              ...flightData
                  .map((flight) => FlightCard(flight: flight))
                  .toList(),
            ]),
          ),
        ],
      ),
    );
  }
}

class FlightCard extends StatelessWidget {
  final Map<String, dynamic> flight;

  FlightCard({required this.flight});

  @override
  Widget build(BuildContext context) {
    final priceFormatter = NumberFormat.currency(locale: 'tr_TR', symbol: '₺');
    final formattedPrice = priceFormatter.format(flight['price']);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(flight['image']),
                          radius: 14.sp,
                        ),
                      ),
                      SizedBox(width: 8.sp),
                      Text(
                        flight['airline'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        'Buy',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                          color: Color.fromARGB(255, 5, 190, 146),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 11.sp,
                        color: Color.fromARGB(255, 5, 190, 146),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.w),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: Icon(
                          Icons.date_range_rounded,
                          size: 14.sp,
                          color: Color.fromARGB(255, 5, 190, 146),
                        ),
                      ),
                      SizedBox(width: 1),
                      Text(
                        DateFormat('d MMM, EEE, HH:mm a')
                            .format(flight['date']),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                          color: Color.fromARGB(255, 5, 190, 146),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    height: 1.h,
                    width: double.infinity,
                    child: Row(
                      children: List.generate(
                        19,
                        (index) => Container(
                          width: 9,
                          height: 2.0,
                          color: Color.fromARGB(255, 217, 215, 215),
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: 1.h,
                          width: 70.w,
                          color: Color.fromARGB(255, 242, 242, 242),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 0,
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.flight,
                            color: Color.fromARGB(255, 5, 190, 146),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 0,
                        bottom: 0,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 244, 67, 54),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CA",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Color.fromARGB(255, 160, 160, 160)),
                      ),
                      Text(
                        formattedPrice,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "EG",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            color: Color.fromARGB(255, 160, 160, 160)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
