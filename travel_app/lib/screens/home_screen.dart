import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> data = [
    {
      'image': 'assets/images/home1.png',
      'title': 'Niagara Falls',
      'distance': '138 km',
      'location': 'Niagara, America'
    },
    {
      'image': 'assets/images/home2.png',
      'title': 'CN Tower',
      'distance': '15 km',
      'location': 'Toronto, Canada'
    },
    {
      'image': 'assets/images/home1.png',
      'title': 'Niagara Falls',
      'distance': '138 km',
      'location': 'Niagara, America'
    },
    {
      'image': 'assets/images/home2.png',
      'title': 'CN Tower',
      'distance': '15 km',
      'location': 'Toronto, Canada'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Geri butonunu kaldırır
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 15.sp,
                  ),
                ),
                SizedBox(width: 8.sp),
                Text(
                  'Mert Demir',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 4.sp),
                Text(
                  'Toronto, Canada',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'Places Near You',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            ListViewOne(data: data),
            SizedBox(height: 4.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'Popular Places',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            ListViewTwo(data: data),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                'Live History',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            ListViewThree(data: data),
            SizedBox(height: 2.h),
            ListViewFour(data: data),
          ],
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for country or city',
                hintStyle: TextStyle(color: Colors.black54),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none, // Çizgi olmadan köşe yuvarlatma
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search,
                    color: Colors.black54), // Sol tarafa arama ikonu ekleme
              ),
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(width: 4.w),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 5, 190, 146),
                width: 1, // Çizgi kalınlığı
              ),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: IconButton(
              icon: Icon(
                Icons.filter_list_outlined,
                size: 34.sp,
                color: Color.fromARGB(255, 5, 190, 146),
              ),
              onPressed: () {
                // Ayarlar butonuna tıklanıldığında yapılacak işlemleri buraya ekleyin
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewFour extends StatelessWidget {
  const ListViewFour({
    super.key,
    required this.data,
  });

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(itemData: data[index]),
                ),
              );
            },
            child: Container(
              width: 80.w,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: Color.fromARGB(255, 238, 238, 238),
                  width: 1, // Çizgi kalınlığı
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.sp),
                child: Stack(
                  children: [
                    Container(
                      width: 80.w,
                      height: 15.h,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.w),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.sp),
                            child: Image.asset(
                              data[index]['image'],
                              width: 20.w,
                              height: 15.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  data[index]['title'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  data[index]['distance'],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color.fromARGB(255, 115, 115, 115),
                                  ),
                                ),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListViewThree extends StatelessWidget {
  const ListViewThree({
    super.key,
    required this.data,
  });

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(itemData: data[index]),
                ),
              );
            },
            child: Container(
              width: 80.w,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: Color.fromARGB(255, 238, 238, 238),
                  width: 1, // Çizgi kalınlığı
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.sp),
                child: Stack(
                  children: [
                    Container(
                      width: 80.w,
                      height: 15.h,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.w),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.sp),
                            child: Image.asset(
                              data[index]['image'],
                              width: 20.w,
                              height: 15.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  data[index]['title'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  data[index]['distance'],
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color.fromARGB(255, 115, 115, 115),
                                  ),
                                ),
                                Spacer(flex: 1),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListViewTwo extends StatelessWidget {
  const ListViewTwo({
    super.key,
    required this.data,
  });

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h, // ListView'in yüksekliği
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(itemData: data[index]),
                ),
              );
            },
            child: Container(
              width: 80.w, // Genişliği artırıldı
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(
                  color: Color.fromARGB(255, 238, 238, 238),
                  width: 1, // Çizgi kalınlığı
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.sp),
                child: Stack(
                  children: [
                    Image.asset(
                      data[index]['image'],
                      width: 80.w, // Genişliği artırıldı
                      height: 30.h,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 80.w, // Genişliği artırıldı
                      height: 30.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromARGB(255, 36, 36, 36).withOpacity(0.4),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2.h,
                      left: 2.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['title'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            data[index]['distance'],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListViewOne extends StatelessWidget {
  const ListViewOne({
    super.key,
    required this.data,
  });

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h, // ListView'in yüksekliği
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(itemData: data[index]),
                ),
              );
            },
            child: Container(
              width: 50.w,
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                border: Border.all(
                  color: Color.fromARGB(255, 238, 238, 238),
                  width: 1, // Çizgi kalınlığı
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.sp),
                child: Stack(
                  children: [
                    Image.asset(
                      data[index]['image'],
                      width: 50.w,
                      height: 30.h,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 50.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromARGB(255, 36, 36, 36).withOpacity(0.4),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2.h,
                      left: 2.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index]['title'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            data[index]['distance'],
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
