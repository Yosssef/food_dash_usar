import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
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
      backgroundColor: scheme.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Container(
                width: 84.w,
                height: 84.h,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: scheme.onPrimary,
                  size: 38.r,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  color: scheme.onPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Sign in to order your favorites',
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
              SizedBox(height: 26.h),

              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight:
                      MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      200.h,
                ),
                decoration: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(22.w, 28.h, 22.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthField(
                      controller: _emailController,
                      hint: 'Email',
                      icon: Icons.mail_outline_rounded,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 14.h),
                    AuthField(
                      controller: _passwordController,
                      hint: 'Password',
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
                        onPressed: () => setState(() => _obscure = !_obscure),
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
                          'Forgot password?',
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
                        'Log In',
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
                          "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, kRegister),
                          child: Text(
                            'Register',
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
      ),
    );
  }
}
