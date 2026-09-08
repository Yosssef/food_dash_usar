import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/home/presentation/manger/settings_cubit.dart';
import 'package:shopix_user/feature/home/presentation/manger/settings_state.dart';
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
              context.tr("settings.title"),
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w900,
                color: scheme.secondary,
              ),
            ),
            SizedBox(height: 22.h),

            SectionLabel(context.tr("settings.notifications_section")),
            ToggleRow(
              icon: Icons.notifications_none_rounded,
              label: context.tr("settings.push_notifications"),
              value: _notifications,
              onChanged: (v) => setState(() => _notifications = v),
            ),
            ToggleRow(
              icon: Icons.local_shipping_outlined,
              label: context.tr("settings.order_status_updates"),
              value: _orderUpdates,
              onChanged: (v) => setState(() => _orderUpdates = v),
            ),
            ToggleRow(
              icon: Icons.local_offer_outlined,
              label: context.tr("settings.offers_promotions"),
              value: _promotions,
              onChanged: (v) => setState(() => _promotions = v),
            ),

            SizedBox(height: 16.h),
            SectionLabel(context.tr("settings.preferences_section")),

            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                final isDark = state.themeMode == ThemeMode.dark;

                return ToggleRow(
                  icon: Icons.mode_night_sharp,
                  label: context.tr("settings.application_theme"),
                  value: isDark,
                  onChanged: (v) {
                    context.read<SettingsCubit>().updateTheme(v);
                  },
                  inactivecolor: const Color(0xffE0A23A),
                  activecolor: const Color.fromARGB(255, 152, 70, 220),
                );
              },
            ),

            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return NavRow(
                  icon: Icons.language_rounded,
                  label: context.tr("settings.language"),
                  trailingText: state.locale.languageCode == 'ar'
                      ? 'العربية'
                      : 'English',
                  onTap: () {
                    final newLang = state.locale.languageCode == 'ar'
                        ? 'en'
                        : 'ar';
                    context.read<SettingsCubit>().updateLanguage(newLang);
                  },
                );
              },
            ),

            NavRow(
              icon: Icons.location_on_outlined,
              label: context.tr("profile.saved_addresses"),
              onTap: () {},
            ),
            NavRow(
              icon: Icons.account_balance_wallet_outlined,
              label: context.tr("profile.payment_methods"),
              onTap: () {},
            ),

            SizedBox(height: 16.h),
            SectionLabel(context.tr("settings.about_section")),
            NavRow(
              icon: Icons.description_outlined,
              label: context.tr("settings.terms_conditions"),
              onTap: () {},
            ),
            NavRow(
              icon: Icons.privacy_tip_outlined,
              label: context.tr("settings.privacy_policy"),
              onTap: () {},
            ),
            NavRow(
              icon: Icons.info_outline_rounded,
              label: context.tr("settings.app_version"),
              trailingText: '1.0.0',
              onTap: null,
            ),

            SizedBox(height: 16.h),
            NavRow(
              icon: Icons.logout_rounded,
              label: context.tr("settings.log_out"),
              color: scheme.error,
              onTap: () {
                context.read<SettingsCubit>().logout();
                if (!mounted) return;
                Navigator.popAndPushNamed(context, kLogin);
              },
            ),
            SizedBox(height: 45.h),
          ],
        ),
      ),
    );
  }
}
