import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/home/presentation/widgets/profile/section_lebel.dart';
import 'package:shopix_user/feature/home/presentation/widgets/setting/nav_row.dart';
import 'package:shopix_user/feature/home/presentation/widgets/setting/toggle_row.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notifications = true;
  bool _orderUpdates = true;
  bool _promotions = false;
  bool _appTheme = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w900,
                color: scheme.secondary,
              ),
            ),
            SizedBox(height: 22.h),

            SectionLabel('Notifications'),
            ToggleRow(
              icon: Icons.notifications_none_rounded,
              label: 'Push notifications',
              value: _notifications,
              onChanged: (v) => setState(() => _notifications = v),
            ),
            ToggleRow(
              icon: Icons.local_shipping_outlined,
              label: 'Order status updates',
              value: _orderUpdates,
              onChanged: (v) => setState(() => _orderUpdates = v),
            ),
            ToggleRow(
              icon: Icons.local_offer_outlined,
              label: 'Offers & promotions',
              value: _promotions,
              onChanged: (v) => setState(() => _promotions = v),
            ),

            SizedBox(height: 16.h),
            SectionLabel('Preferences'),
            ToggleRow(
              icon: Icons.mode_night_sharp,
              label: 'Applcation Theme',
              value: _appTheme,
              onChanged: (v) => setState(() => _appTheme = v),
              activecolor: Color(0xffE0A23A),
              inactivecolor: Color.fromARGB(255, 152, 70, 220),
            ),
            NavRow(
              icon: Icons.language_rounded,
              label: 'Language',
              trailingText: 'English',
              onTap: () {},
            ),
            NavRow(
              icon: Icons.location_on_outlined,
              label: 'Saved Addresses',
              onTap: () {},
            ),
            NavRow(
              icon: Icons.account_balance_wallet_outlined,
              label: 'Payment Methods',
              onTap: () {},
            ),

            SizedBox(height: 16.h),
            SectionLabel('About'),
            NavRow(
              icon: Icons.description_outlined,
              label: 'Terms & Conditions',
              onTap: () {},
            ),
            NavRow(
              icon: Icons.privacy_tip_outlined,
              label: 'Privacy Policy',
              onTap: () {},
            ),
            NavRow(
              icon: Icons.info_outline_rounded,
              label: 'App Version',
              trailingText: '1.0.0',
              onTap: null,
            ),

            SizedBox(height: 16.h),
            NavRow(
              icon: Icons.logout_rounded,
              label: 'Log Out',
              color: scheme.error,
              onTap: () {},
            ),
            SizedBox(height: 45.h),
          ],
        ),
      ),
    );
  }
}
