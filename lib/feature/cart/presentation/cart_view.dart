import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                    bottom: 90.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.r),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            "Your Cart",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 27.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.r),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Pizza Hat",
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: sampleCartItems.length,
                                itemBuilder: (context, index) {
                                  final item = sampleCartItems[index];
                                  return CartItemTile(
                                    item: item,
                                    onIncrement: () {},
                                    onDecrement: () {},
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          hintText: "Coupon Code",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 22.sp,
                          ),
                          prefixIcon: Icon(
                            Icons.discount,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.r),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.r,
                                  vertical: 5.r,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(
                                        fontSize: 20.sp,

                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                    Text(
                                      "EGP 355",
                                      style: TextStyle(
                                        fontSize: 20.sp,

                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.r,
                                  vertical: 5.r,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Delivery fee",
                                      style: TextStyle(
                                        fontSize: 20.sp,

                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                    Text(
                                      "EGP 15",
                                      style: TextStyle(
                                        fontSize: 20.sp,

                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.r,
                                  vertical: 5.r,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tax",
                                      style: TextStyle(
                                        fontSize: 20.sp,

                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                    Text(
                                      "EGP 18",
                                      style: TextStyle(
                                        fontSize: 20.sp,

                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 350.h,
                                height: 20.h,
                                child: CustomPaint(
                                  painter: DashedVerticalLinePainter(
                                    color: Colors.grey.shade400,
                                    dashHeight: 4,
                                    dashSpace: 5,
                                    strokeWidth: 1.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.r,
                                  vertical: 5.r,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                        fontSize: 23.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                    Text(
                                      "EGP 388",
                                      style: TextStyle(
                                        fontSize: 23.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.w,
              right: 20.w,
              bottom: 5.h,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, kCheckout),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Go To Checkout",
                        style: TextStyle(
                          fontSize: 27.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemModel {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

final List<CartItemModel> sampleCartItems = [
  CartItemModel(id: '1', name: 'Margherita Pizza', price: 145, quantity: 1),
  CartItemModel(id: '2', name: 'Pepperoni Pizza', price: 180, quantity: 2),
  CartItemModel(id: '3', name: 'BBQ Chicken Pizza', price: 210, quantity: 1),
  CartItemModel(id: '4', name: 'Margherita Pizza', price: 145, quantity: 1),
  CartItemModel(id: '25', name: 'Pepperoni Pizza', price: 180, quantity: 2),
  CartItemModel(id: '36', name: 'BBQ Chicken Pizza', price: 210, quantity: 1),
];

class CartItemTile extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Name and Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E1E1E),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'EGP ${item.price.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 16.r,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF9E9E9E),
                ),
              ),
            ],
          ),

          // Quantity Counter Counter Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withAlpha(
                80,
              ), // Light greenish background
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Minus Button
                _buildCircleButton(icon: Icons.remove, onTap: onDecrement),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    '${item.quantity}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                // Plus Button
                _buildCircleButton(icon: Icons.add, onTap: onIncrement),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF4A6B4E)),
      ),
    );
  }
}

class DashedVerticalLinePainter extends CustomPainter {
  final Color color;
  final double dashHeight;
  final double dashSpace;
  final double strokeWidth;

  DashedVerticalLinePainter({
    this.color = Colors.grey,
    this.dashHeight = 5.0,
    this.dashSpace = 3.0,
    this.strokeWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    while (startY < size.width) {
      canvas.drawLine(Offset(startY, 0), Offset(startY + dashHeight, 0), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
