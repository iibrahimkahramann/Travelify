import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/screens/auth_screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: WelcomeScreen(),
        );
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final List<String> imageList = [
    'assets/images/welcome_image.png',
    'assets/images/welcome_image.png',
    'assets/images/welcome_image.png',
  ];

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WelcomeImages(controller: controller, imageList: imageList),
            ImageController(controller: controller, imageList: imageList),
            WelcomeStack(),
          ],
        ),
      ),
    );
  }
}

class WelcomeStack extends StatelessWidget {
  const WelcomeStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            bottom: 0.h,
            left: 0,
            right: 0,
            child: Container(
              width: 30.w,
              height: 50.h,
              child: Image.asset(
                'assets/images/Ellipse5.png', //Alttaki resim
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 0,
            right: 0,
            top: 70,
            child: Container(
              width: 30.w,
              height: 50.h,
              child: Image.asset(
                'assets/images/Ellipse4.png', //Üstteki resim
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 100,
            right: 0,
            top: 160,
            child: Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 0,
            right: 0,
            top: 240,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.w), // Sol ve sağdan 20.w uzaklık
              child: Text(
                "Travelify makes your travels easier, travel lists the cities you can visit and the places to keep you company in places.",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center, // Metni ortala
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 0,
            right: 0,
            top: 370,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical:
                      2.h), // Ekran genişliği ve yüksekliğine göre padding
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      "Let's Start",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 5, 190, 146)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageController extends StatelessWidget {
  const ImageController({
    super.key,
    required this.controller,
    required this.imageList,
  });

  final PageController controller;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h, // Ekranın yüksekliğinin %5'i
      child: SmoothPageIndicator(
        controller: controller,
        count: imageList.length,
        effect: WormEffect(
          dotHeight: 1.h, // Ekranın yüksekliğinin %1'i
          dotWidth: 2.w, // Ekranın genişliğinin %2'si
          type: WormType.thinUnderground,
        ),
      ),
    );
  }
}

class WelcomeImages extends StatelessWidget {
  const WelcomeImages({
    super.key,
    required this.controller,
    required this.imageList,
  });

  final PageController controller;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 5.h, // Ekranın yüksekliğinin %5'i kadar üstten boşluk
      ),
      child: SizedBox(
        height: 30.h, // Ekranın yüksekliğinin %30'u
        width: 60.w, // Ekranın genişliğinin %60'ı
        child: PageView.builder(
          controller: controller,
          itemCount: imageList.length,
          itemBuilder: (_, index) {
            return Image.asset(
              imageList[index],
              fit: BoxFit.fitWidth,
            );
          },
        ),
      ),
    );
  }
}
