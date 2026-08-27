import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/constant.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: EdgeInsets.all(2.r),
            child: RestaurantCard(restaurant: restaurants[index]),
          );
        }, childCount: restaurants.length),
      ),
    );
  }
}

class RestaurantModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isFavorite;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

final List<RestaurantModel> restaurants = [
  RestaurantModel(
    id: '1',
    name: "McDonald's",
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr7k3_2DZ2mDM_hW9D1kLyXYcNRhQ5R0ZFJxYN9brmMpFVPzsHI6U8RgMh&s=10',
  ),
  RestaurantModel(
    id: '2',
    name: 'Buffalo Burger',
    imageUrl:
        'https://www.mcdonalds.eg/Cms_Data/Contents/Ar/Media/ChickenLTO2026/AR-640x470.jpg',
  ),
  RestaurantModel(
    id: '3',
    name: 'KFC',
    imageUrl:
        'https://eg-24.com/wp-content/uploads/2026/04/%D9%85%D9%86%D9%8A%D9%88-%D9%83%D9%86%D8%AA%D8%A7%D9%83%D9%8A-%D9%85%D8%B7%D8%B9%D9%85-%D9%82%D8%A7%D8%A6%D9%85%D8%A9-%D8%A7%D9%84%D8%AC%D8%AF%D9%8A%D8%AF-%D8%B1%D9%82%D9%85-%D8%A7%D9%84%D8%A3%D8%B3%D8%B9%D8%A7%D8%B1-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9-%D8%B9%D8%B1%D8%A8%D9%8A-KFC-Menu-prices-updated-2024-1.webp',
  ),
  RestaurantModel(
    id: '4',
    name: 'Pizza Hut',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfZF6l9byfmuUuzt-mNHHTHItzaKytgbgkFEdQ8OAK2OKEVykaW2h3_Hnb&s=10',
  ),
  RestaurantModel(
    id: '5',
    name: 'Papa Johns',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-psGkbbSoZZh42gOy4J0NYCVd8471jwEyW3ZTF-zM6bdjXHKZzCkHMbvt&s=10',
  ),
  RestaurantModel(
    id: '6',
    name: 'Hardee\'s',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReHNr0RkE4nEFxpUdhHtXyCxQ15h_R-PfbMrgru1XCjw&s=10',
  ),
  RestaurantModel(
    id: '7',
    name: 'Bazooka',
    imageUrl: 'https://dalilzag.com//uploads/2023/03/v7IPEztJCxuWnAFKlZyR.jpg',
  ),
  RestaurantModel(
    id: '8',
    name: 'Cinnabon',
    imageUrl:
        'https://images.deliveryhero.io/image/hungerstation/restaurant/android_cover_photo/0a50dd8d8a5b541abfc4bfa1a33c24d6.jpg',
  ),
];

class RestaurantCard extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = widget.restaurant.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, kRestaurant);
      },
      child: Container(
        width: double.infinity,
        height: 220.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Image.network(
                widget.restaurant.imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: const Icon(
                      Icons.fastfood,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.onPrimary.withAlpha(250),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border_rounded,
                        color: Theme.of(context).colorScheme.error,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
