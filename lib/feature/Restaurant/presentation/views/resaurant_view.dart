import 'package:flutter/material.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurant_body.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_header.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Stack(children: [RestaurantHeader(), RestaurantBody()]),
        ),
      ),
    );
  }
}
