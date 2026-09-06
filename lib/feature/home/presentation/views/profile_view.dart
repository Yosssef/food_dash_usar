import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/feature/Restaurant/presentation/views/restaurants_results.dart';
import 'package:shopix_user/feature/home/presentation/widgets/profile/custom_appbar.dart';
import 'package:shopix_user/feature/home/presentation/widgets/profile/identity_card.dart';
import 'package:shopix_user/feature/home/presentation/widgets/profile/profile_row.dart';
import 'package:shopix_user/feature/home/presentation/widgets/profile/quick_data.dart';
import 'package:shopix_user/feature/home/presentation/widgets/profile/section_lebel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
          children: [
            CustomProfileAppBar(scheme: scheme, title: 'Profile'),
            SizedBox(height: 22.h),

            IdentityCard(scheme: scheme),
            SizedBox(height: 16.h),

            QuickData(),
            SizedBox(height: 20.h),

            SectionLabel('Account'),
            ProfileRow(
              icon: Icons.receipt_long_outlined,
              label: 'My Orders',
              onTap: () => Navigator.pushNamed(context, kOrdersview),
            ),
            ProfileRow(
              icon: Icons.favorite_border_rounded,
              label: 'Favorites',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                      RestaurantsResultsView(mode: ResultsMode.favorites),
                ),
              ),
            ),
            ProfileRow(
              icon: Icons.location_on_outlined,
              label: 'Saved Addresses',
              onTap: () {},
            ),
            ProfileRow(
              icon: Icons.account_balance_wallet_outlined,
              label: 'Payment Methods',
              onTap: () {},
            ),

            SizedBox(height: 16.h),
            SectionLabel('More'),
            ProfileRow(
              icon: Icons.settings_outlined,
              label: 'Settings',
              onTap: () => Navigator.pushNamed(context, kSettings),
            ),
            ProfileRow(
              icon: Icons.help_outline_rounded,
              label: 'Help & Support',
              onTap: () {},
            ),
            ProfileRow(
              icon: Icons.logout_rounded,
              label: 'Log Out',
              color: scheme.error,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
