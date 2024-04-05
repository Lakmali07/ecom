import 'package:ecom/views/home_view.dart';
import 'package:ecom/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class TabView extends StatefulWidget{
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {//with RouteAware{
  dynamic selected;
  PageController controller = PageController(initialPage: 2);
  String _currentCity = 'City Location';

  @override
  void initState() {
    super.initState();
    selected = 2;
    _getCurrentPosition();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   //routeObserver.subscribe(this, PageRoute.of(context));
  // }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium)
        .then((Position position) {
          print(position);
         _getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentCity = place.locality ?? '';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,50),
        child: SafeArea(
          child: Container( // extra container for custom bottom shadows
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_currentCity),
                IconButton(onPressed: (){
                }, icon: const Icon(Icons.notifications_none))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          //iconSize: 50,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.Default,
         inkColor: Colors.yellow,
          inkEffect: true,
          // opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            //selectedColor: Colors.yellow,
              icon: const Icon(
                Icons.style_outlined,
              ),
              title: const Text('Services')),
          BottomBarItem(
            //selectedColor: Colors.yellow,
            icon: const Icon(
              Icons.messenger_outline,
            ),
            title: const Text('Message'),
          ),
          BottomBarItem(
            //selectedColor: Colors.yellow,
            icon: const Icon(
              Icons.house_outlined,
            ),
            title: const Text('Home'),
          ),
          BottomBarItem(
            //selectedColor: Colors.yellow,
            icon: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Cart'),
          ),
          BottomBarItem(
              //selectedColor: Colors.yellow,
              icon: const Icon(
                Icons.person_outline,
              ),
              title: const Text('Profile')),
        ],
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      body: PageView(
          controller: controller,
          children: const [
            Center(child: Text('Services')),
            Center(child: Text('Messages')),
            HomeView(),
            Center(child: Text('Cart')),
            ProfileView(),
          ],
        ),
    );
  }

}
