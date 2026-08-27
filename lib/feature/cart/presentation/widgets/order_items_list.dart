import 'package:flutter/material.dart';
import 'package:shopix_user/feature/cart/presentation/views/cart_view.dart';

class OrderItemsList extends StatelessWidget {
  const OrderItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sampleCartItems.length,
      itemBuilder: (context, index) {
        final item = sampleCartItems[index];
        return CartItemTile(item: item, onIncrement: () {}, onDecrement: () {});
      },
    );
  }
}
