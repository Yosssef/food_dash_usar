import 'package:flutter_test/flutter_test.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/all_orders/order_card.dart';
import 'package:shopix_user/feature/orders/presentation/widgets/all_orders/status_pill.dart';

void main() {
  group('OrderModel Tests', () {
    test(
      'Should create OrderModel instance correctly with delivered status',
      () {
        // 1. Arrange
        const order = OrderModel(
          restaurantImageUrl: 'https://example.com/logo.png',
          restaurantName: "McDonald's",
          itemsSummary: '2x Big Mac, 1x McChicken',
          total: 388.0,
          status: OrderStatus.delivered,
          rating: 4.5,
        );

        expect(order.restaurantName, "McDonald's");
        expect(order.total, 388.0);
        expect(order.status, OrderStatus.delivered);
        expect(order.rating, 4.5);
      },
    );

    test('Should identify non-delivered order without rating', () {
      const order = OrderModel(
        restaurantImageUrl: 'https://example.com/logo.png',
        restaurantName: "Bella Napoli",
        itemsSummary: '1x Margherita',
        total: 150.0,
        status: OrderStatus.preparing,
      );

      expect(order.status, isNot(OrderStatus.delivered));
      expect(order.rating, isNull);
    });
  });
}
