import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/auth/presentation/widgets/auth_filed.dart';
import 'package:shopix_user/feature/home/presentation/manger/settings_cubit.dart';
import 'package:shopix_user/feature/home/presentation/manger/settings_state.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final lang = context.watch<SettingsCubit>().state.locale.languageCode;
    return Scaffold(
      backgroundColor: scheme.surface,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(22.w, 8.h, 22.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              Text(
                AppStrings.t("auth.create_account_title", lang),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  color: scheme.primary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                AppStrings.t("auth.create_account_subtitle", lang),
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade500),
              ),
              SizedBox(height: 26.h),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: scheme.primary.withAlpha(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
                child: BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, state) {
                    final settings = state.settings;
                    final isDark = state.themeMode == ThemeMode.dark;

                    return Column(
                      children: [
                        ProfileAvatar(
                          isDark: isDark,
                          userProfileImagePath: settings.userProfileImagePath,
                          onChangePhoto: () =>
                              context.read<SettingsCubit>().pickProfileImage(),
                        ),
                        SizedBox(height: 16.h),

                        AuthField(
                          controller: _nameController,
                          hint: AppStrings.t("auth.full_name_hint", lang),

                          icon: Icons.person_outline_rounded,
                        ),
                        SizedBox(height: 12.h),

                        AuthField(
                          controller: _emailController,
                          hint: AppStrings.t("auth.email_hint", lang),
                          icon: Icons.mail_outline_rounded,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 12.h),

                        AuthField(
                          controller: _phoneController,
                          hint: AppStrings.t("auth.phone_hint", lang),
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 12.h),

                        AuthField(
                          controller: _passwordController,
                          hint: AppStrings.t("auth.password_hint", lang),
                          icon: Icons.lock_outline_rounded,
                          obscure: _obscurePassword,
                          trailing: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey.shade400,
                              size: 20.r,
                            ),
                            onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),

                        AuthField(
                          controller: _confirmPasswordController,
                          hint: AppStrings.t(
                            "auth.confirm_password_hint",
                            lang,
                          ),
                          icon: Icons.lock_outline_rounded,
                          obscure: _obscureConfirmPassword,
                          trailing: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.grey.shade400,
                              size: 20.r,
                            ),
                            onPressed: () => setState(
                              () => _obscureConfirmPassword =
                                  !_obscureConfirmPassword,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 22.h),
              ElevatedButton(
                onPressed: () {
                  context.read<SettingsCubit>().saveUserData(
                    token: 'dummy_token_123',
                    name: _nameController.text,
                    email: _emailController.text,
                  );
                  Navigator.pushReplacementNamed(context, kHome);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: scheme.secondary,
                  foregroundColor: scheme.onPrimary,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  AppStrings.t("auth.create_account_button", lang),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                AppStrings.t("auth.terms_notice", lang),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade400),
              ),
              SizedBox(height: 18.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.t("auth.already_have_account", lang),
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      AppStrings.t("auth.log_in", lang),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w800,
                        color: scheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String? userProfileImagePath;
  final bool isDark;
  final VoidCallback onChangePhoto;

  const ProfileAvatar({
    super.key,
    required this.userProfileImagePath,
    required this.isDark,
    required this.onChangePhoto,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final path = userProfileImagePath;
    final hasCustomPhoto = path != null && File(path).existsSync();

    final ImageProvider avatarImage = hasCustomPhoto
        ? FileImage(File(path))
        : AssetImage(
                isDark
                    ? 'assets/images/user_dark.png'
                    : 'assets/images/user.png',
              )
              as ImageProvider;

    return Stack(
      children: [
        GestureDetector(
          onTap: onChangePhoto,
          child: Container(
            width: 100.r,
            height: 100.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: avatarImage, fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: onChangePhoto,
            child: Container(
              width: 30.r,
              height: 30.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: scheme.secondary,
                border: Border.all(color: scheme.surface, width: 2.5),
              ),
              child: Icon(Icons.add, color: scheme.onSecondary, size: 16.r),
            ),
          ),
        ),
      ],
    );
  }
}
