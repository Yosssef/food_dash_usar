import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';
import 'package:shopix_user/feature/auth/presentation/widgets/auth_filed.dart';

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
  bool _obscure = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

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
                'Create your account',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  color: scheme.primary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "It only takes a minute — you'll be ordering right after.",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade500),
              ),
              SizedBox(height: 26.h),

              Container(
                height: 350.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                  color: scheme.primary.withAlpha(50),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.r,
                    vertical: 20.r,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AuthField(
                        controller: _nameController,
                        hint: 'Full name',
                        icon: Icons.person_outline_rounded,
                      ),

                      AuthField(
                        controller: _emailController,
                        hint: 'Email',
                        icon: Icons.mail_outline_rounded,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      AuthField(
                        controller: _phoneController,
                        hint: 'Phone number',
                        icon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                      ),

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

                      AuthField(
                        controller: _passwordController,
                        hint: 'Confirm Password',
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, kHome),
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
                  'Create Account',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'By continuing you agree to our Terms and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11.sp, color: Colors.grey.shade400),
              ),
              SizedBox(height: 18.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      'Log In',
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
