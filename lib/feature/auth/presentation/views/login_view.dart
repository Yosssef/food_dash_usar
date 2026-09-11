import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/auth/presentation/widgets/auth_filed.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            colors: [scheme.primary, scheme.primary.withValues(alpha: 0.8)],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            physics: const ScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    SizedBox(height: 40.h),

                    Container(
                      width: 135.w,
                      height: 135.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.16),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_bag_rounded,
                        color: scheme.onPrimary,
                        size: 65.r,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w900,
                        ),
                        children: [
                          TextSpan(
                            text: "Food",
                            style: TextStyle(color: scheme.onPrimary),
                          ),
                          TextSpan(
                            text: "Dash",
                            style: TextStyle(color: scheme.secondary),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      context.tr("auth.sign_in_subtitle"),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: Colors.white.withValues(alpha: 0.85),
                      ),
                    ),

                    const Spacer(),
                    SizedBox(height: 30.h),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: scheme.surface,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28.r),
                          topRight: Radius.circular(28.r),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(22.w, 28.h, 22.w, 24.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AuthField(
                            controller: _emailController,
                            hint: context.tr("auth.email_hint"),
                            icon: Icons.mail_outline_rounded,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 14.h),
                          AuthField(
                            controller: _passwordController,
                            hint: context.tr("auth.password_hint"),
                            icon: Icons.lock_outline_rounded,
                            obscure: _obscure,
                            trailing: IconButton(
                              icon: Icon(
                                _obscure
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey.shade400,
                                size: 20.r,
                              ),
                              onPressed: () =>
                                  setState(() => _obscure = !_obscure),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                context.tr("auth.forgot_password"),
                                style: TextStyle(
                                  fontSize: 12.5.sp,
                                  fontWeight: FontWeight.w700,
                                  color: scheme.secondary,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 18.h),
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.pushReplacementNamed(context, kHome),
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
                              context.tr("auth.log_in"),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(height: 22.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.tr("auth.no_account"),
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, kRegister),
                                child: Text(
                                  context.tr("auth.register"),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
