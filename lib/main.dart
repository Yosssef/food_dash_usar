import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/core/data/user_data.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/core/theme/app_theme.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/resaurant_view.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';
import 'package:shopix_user/feature/auth/presentation/views/login_view.dart';
import 'package:shopix_user/feature/auth/presentation/views/register_view.dart';
import 'package:shopix_user/feature/auth/presentation/views/splash_view.dart';
import 'package:shopix_user/feature/cart/presentation/views/cart_view.dart';
import 'package:shopix_user/feature/checkout/presentation/views/check_out_view.dart';
import 'package:shopix_user/feature/home/presentation/manger/settings_cubit.dart';
import 'package:shopix_user/feature/home/presentation/manger/settings_state.dart';
import 'package:shopix_user/feature/home/presentation/views/home_view.dart';
import 'package:shopix_user/feature/home/presentation/views/profile_view.dart';
import 'package:shopix_user/feature/home/presentation/views/setting_view.dart';
import 'package:shopix_user/feature/orders/presentation/views/orders_info.dart';
import 'package:shopix_user/feature/orders/presentation/views/all_orders.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserSettingsAdapter());
  await Hive.openBox<UserSettings>('settingsBox');
  await AppStrings.load();
  runApp(const FoodDash());
}

class FoodDash extends StatelessWidget {
  const FoodDash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            routes: {
              kHome: (context) => const MyHomePage(),
              kRestaurant: (context) => const RestaurantView(),
              kCart: (context) => const CartView(),
              kCheckout: (context) => const CheckOutView(),
              kOrdersview: (context) => const OredersView(),
              kOrderinfo: (context) => const OrdersInfo(),
              kProfile: (context) => const ProfileView(),
              kSplach: (context) => const SplashView(),
              kSettings: (context) => const SettingsView(),
              kRegister: (context) => const RegisterView(),
              kLogin: (context) => const LoginView(),
            },
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            initialRoute: kSplach,
            locale: state.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
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

  final List<Widget?> _loadedScreens = [const HomeView(), null, null, null];

  Widget _getScreen(int index) {
    if (_loadedScreens[index] == null) {
      switch (index) {
        case 1:
          _loadedScreens[1] = const OredersView();
          break;
        case 2:
          _loadedScreens[2] = const RestaurantsResultsView(
            mode: ResultsMode.favorites,
          );
          break;
        case 3:
          _loadedScreens[3] = const SettingsView();
          break;
      }
    }
    return _loadedScreens[index]!;
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          Positioned.fill(
            child: RepaintBoundary(
              child: LazyIndexedStack(
                index: _currentIndex,
                children: List.generate(4, (index) {
                  if (_loadedScreens[index] != null || index == _currentIndex) {
                    return _getScreen(index);
                  }
                  return const SizedBox.shrink();
                }),
              ),
            ),
          ),

          Positioned(
            left: 60.w,
            right: 60.w,
            bottom: 5.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: scheme.shadow.withValues(alpha: 0.04),
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
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: scheme.surfaceContainerHighest,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: Colors.grey.shade400,
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14.sp,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      icon: const FaIcon(FontAwesomeIcons.house, size: 20),
                      activeIcon: const Icon(Icons.home, size: 24),
                      label: context.tr('nav.home'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.receipt_long_outlined, size: 22),
                      activeIcon: Icon(Icons.receipt_long_rounded, size: 24),
                      label: context.tr('nav.orders'),
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.heart, size: 20),
                      activeIcon: Icon(Icons.favorite_rounded, size: 24),
                      label: context.tr('nav.favorites'),
                    ),
                    BottomNavigationBarItem(
                      icon: FaIcon(FontAwesomeIcons.gear, size: 20),
                      activeIcon: FaIcon(FontAwesomeIcons.gear, size: 20),
                      label: context.tr('nav.setting'),
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

class LazyIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const LazyIndexedStack({
    super.key,
    required this.index,
    required this.children,
  });

  @override
  State<LazyIndexedStack> createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<LazyIndexedStack> {
  late final Set<int> _everBuilt = {widget.index};

  @override
  void didUpdateWidget(covariant LazyIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Once a tab has been visited, its real widget stays built forever
    // after that (so switching tabs still preserves scroll position,
    // form input, etc. — same guarantee IndexedStack normally gives you).
    _everBuilt.add(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.index,
      children: List.generate(widget.children.length, (i) {
        return _everBuilt.contains(i)
            ? widget.children[i]
            : const SizedBox.shrink();
      }),
    );
  }
}
