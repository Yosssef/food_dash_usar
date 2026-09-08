import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/auth/presentation/views/register_view.dart';
import 'package:shopix_user/feature/home/presentation/manger/settings_cubit.dart';

class IdentityCard extends StatelessWidget {
  const IdentityCard({super.key, required this.scheme});

  final ColorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final settings = context.read<SettingsCubit>().loadSettings();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: scheme.surfaceContainer,
        borderRadius: BorderRadius.circular(22.r),
        boxShadow: [
          BoxShadow(
            color: scheme.shadow.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              settings.userProfileImagePath != null
                  ? ProfileAvatar(
                      userProfileImagePath: settings.userProfileImagePath,
                      isDark: settings.isDark,
                      onChangePhoto: () =>
                          context.read<SettingsCubit>().pickProfileImage(),
                    )
                  : CircleAvatar(
                      radius: 34.r,
                      backgroundColor: scheme.secondary,
                      child: Text(
                        (settings.userName ?? '').trim().isEmpty
                            ? '?'
                            : (settings.userName ?? '').trim()[0].toUpperCase(),
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800,
                          color: scheme.onPrimary,
                        ),
                      ),
                    ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 22.r,
                  height: 22.r,
                  decoration: BoxDecoration(
                    color: scheme.secondary,
                    shape: BoxShape.circle,
                    border: Border.all(color: scheme.onPrimary, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 11.r,
                    color: scheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  settings.userName!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: scheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  settings.userEmail!,
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    color: Colors.grey.shade500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
