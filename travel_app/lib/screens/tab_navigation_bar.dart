import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/screens/home_screen.dart';

class BottomNavBarSellerView extends StatefulWidget {
  @override
  _BottomNavBarSellerViewState createState() => _BottomNavBarSellerViewState();
}

class _BottomNavBarSellerViewState extends State<BottomNavBarSellerView> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Stack(
          children: [
            BottomNavigationBar(
              backgroundColor: Color.fromARGB(255, 232, 232, 232),
              unselectedItemColor: Colors.black.withOpacity(0.3),
              selectedItemColor: Color.fromARGB(255, 5, 190, 146),
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              showUnselectedLabels: true,
              iconSize: 25.sp, // İkon boyutunu artırmak için
              selectedLabelStyle: TextStyle(
                  fontSize: 15.sp), // Seçili etiket boyutunu artırmak için
              unselectedLabelStyle: TextStyle(
                  fontSize:
                      10.sp), // Seçili olmayan etiket boyutunu artırmak için
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_library_outlined),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.location_on_outlined),
                  label: 'Places Traveled',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
            Positioned(
              top: 0,
              // MediaQuery.of(context).size.width: Ekranın genişliği
              // / 4: Ekranın genişliğini 4'e böler (her bir BottomNavigationBar öğesinin genişliği)
              // * _selectedIndex: Seçili olan öğenin indeksine göre çubuğun konumunu ayarlar.
              left: MediaQuery.of(context).size.width / 4 * _selectedIndex +
                  (MediaQuery.of(context).size.width / 4 - 40) / 5 +
                  10, // 10: Sol taraftan boşluk bırakmak için
              // Çubuğun genişliği, her bir BottomNavigationBar öğesinin genişliği kadar ayarlanır.
              width: MediaQuery.of(context).size.width / 8,
              child: Container(
                height: 4.0, // Çubuğun yüksekliği
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 5, 190, 146), // Çubuğun rengi
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0), // Üst köşelerin yuvarlatılmas
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
