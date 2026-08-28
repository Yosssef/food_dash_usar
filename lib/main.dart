import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/resaurant_view.dart';
import 'package:shopix_user/feature/cart/presentation/views/cart_view.dart';
import 'package:shopix_user/feature/checkout/presentation/views/check_out_view.dart';
import 'package:shopix_user/feature/home/presentation/views/home_view.dart';
import 'package:shopix_user/feature/orders/presentation/views/orders_info.dart';
import 'package:shopix_user/feature/orders/presentation/views/oreders_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        kHome: (context) => const MyHomePage(),
        kRestaurant: (context) => const RestaurantView(),
        kCart: (context) => const CartView(),
        kCheckout: (context) => const CheckOutView(),
        kOrdersview: (context) => const OredersView(),
        kOrderinfo: (context) => const OrdersInfo(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xffE0A23A),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 53, 109, 70),
          onSecondary: Colors.white,
          error: Color(0xffD6543F),
          onError: Colors.white,
          surface: Color(0xffFAF6EF),
          onSurface: Colors.black87,
        ),
      ),
      initialRoute: kHome,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeView(),
    OredersView(),
    Center(child: Text('Favorites Screen')),
    Center(child: Text('profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(index: _currentIndex, children: _screens),
          ),

          Positioned(
            left: 25.w,
            right: 40.w,
            bottom: 5.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 16,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: Colors.grey.shade400,
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                  ),
                  items: const [
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.house, size: 20),
                      activeIcon: Icon(Icons.home, size: 24),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.receipt_long_outlined, size: 22),
                      activeIcon: Icon(Icons.receipt_long_rounded, size: 24),
                      label: 'Orders',
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.heart, size: 20),
                      activeIcon: Icon(Icons.favorite_rounded, size: 24),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.gear, size: 20),
                      activeIcon: FaIcon(FontAwesomeIcons.gear, size: 20),
                      label: 'Setting',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
