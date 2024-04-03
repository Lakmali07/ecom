import 'package:ecom/views/home_view.dart';
import 'package:ecom/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class TabView extends StatefulWidget{
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {//with RouteAware{
  dynamic selected;
  PageController controller = PageController();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   //routeObserver.subscribe(this, PageRoute.of(context));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            selectedColor: Colors.yellow,
              icon: const Icon(
                Icons.style_outlined,
              ),
              title: const Text('Services')),
          BottomBarItem(
            selectedColor: Colors.yellow,
            icon: const Icon(
              Icons.messenger_outline,
            ),
            title: const Text('Message'),
          ),
          BottomBarItem(
            selectedColor: Colors.yellow,
            icon: const Icon(
              Icons.house_outlined,
            ),
            title: const Text('Home'),
          ),
          BottomBarItem(
            selectedColor: Colors.yellow,
            icon: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Cart'),
          ),
          BottomBarItem(
              selectedColor: Colors.yellow,
              icon: const Icon(
                Icons.person_outline,
              ),
              title: const Text('Profile')),
        ],
        currentIndex: selected ?? 2,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            Center(child: Text('Services')),
            Center(child: Text('Messages')),
            HomeView(),
            Center(child: Text('Cart')),
            ProfileView(),
          ],
        ),
      ),
    );
  }

}
