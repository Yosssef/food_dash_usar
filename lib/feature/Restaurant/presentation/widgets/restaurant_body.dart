import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurant_body/category_item.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurant_body/hot_offer_banner.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurant_body/manu_haedr_button.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurant_body/menu_item_card.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurant_body/restaurant_info.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurant_body/restaurant_name.dart';

class RestaurantBody extends StatefulWidget {
  const RestaurantBody({super.key});

  @override
  State<RestaurantBody> createState() => _RestaurantBodyState();
}

class _RestaurantBodyState extends State<RestaurantBody>
    with SingleTickerProviderStateMixin {
  bool showCategories = false;
  String? selectedCategoryName;

  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.09).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOutQuart),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _openPopular() {
    setState(() {
      showCategories = false;
      selectedCategoryName = null;
    });
  }

  void _openCategoriesGrid() {
    setState(() {
      showCategories = true;
      selectedCategoryName = null;
    });
  }

  void _openCategoryList(String categoryName) {
    setState(() {
      showCategories = true;
      selectedCategoryName = categoryName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 220.h,
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: CustomScrollView(
            slivers: [
              RestaurantName(),
              RestaurantInfo(),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MenuHeaderButton(
                        icon: Icons.star,
                        label: "Popular",
                        selected: !showCategories,
                        onTap: _openPopular,
                        color: Theme.of(context).colorScheme.primary,
                      ),

                      MenuHeaderButton(
                        icon: Icons.list,
                        label: "Categories",
                        selected: showCategories,
                        onTap: _openCategoriesGrid,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  ),
                ),
              ),

              ..._buildContentSlivers(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContentSlivers() {
    if (!showCategories) {
      return [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => MenuItemCard(item: mcDonaldsMenu[index]),
            childCount: mcDonaldsMenu.length,
          ),
        ),
      ];
    }
    if (selectedCategoryName == null) {
      return [
        SliverToBoxAdapter(
          child: HotOfferBanner(
            pulseAnimation: _pulseAnimation,
            onTap: () => _openCategoryList(hotOffersLabel),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 20.h),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14.h,
              crossAxisSpacing: 14.w,
              childAspectRatio: 0.92,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final category = mcDonaldsCategories[index];
              return CategoryGridTile(
                category: category,
                onTap: () => _openCategoryList(category.name),
              );
            }, childCount: mcDonaldsCategories.length),
          ),
        ),
      ];
    }

    final items = selectedCategoryName == hotOffersLabel
        ? hotOfferItems
        : (categoryMenus[selectedCategoryName] ?? const <MenuItemModel>[]);

    return [
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 4.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: _openCategoriesGrid,
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withAlpha(30),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: 18.r,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                selectedCategoryName!,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => MenuItemCard(item: items[index]),
          childCount: items.length,
        ),
      ),
    ];
  }
}

class CategoryModel {
  final String name;
  final String imageUrl;

  const CategoryModel({required this.name, required this.imageUrl});
}

class MenuItemModel {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double? oldPrice;

  const MenuItemModel({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.oldPrice,
  });
}

const String hotOffersLabel = "Hot Offers";

const String _bigMacImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/Big_Mac_hamburger.jpg';
const String _mcChickenImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/McD-McChicken.jpg';
const String _quarterPounderImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/McDonald%27s_Quarter_Pounder_with_Cheese%2C_United_States.jpg';
const String _nuggetsImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/McDonalds-Chicken-McNuggets.jpg';
const String _eggMcMuffinImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/McD-Egg-McMuffin.jpg';
const String _friesImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/McDonald%27s_French_Fries_(2024).jpg';
const String _mcFlurryImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/Mcdonald%27s_Oreo_Taro_McFlurry_(5978319766).jpg';
const String _mcRibImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/McD-McRib.jpg';
const String _filetOFishImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/McDonald%27s_Filet-O-Fish_sandwich_(1).jpg';
const String _applePieImg =
    'https://commons.wikimedia.org/wiki/Special:FilePath/McDonald%27s_apple_pie.JPG';

final List<MenuItemModel> mcDonaldsMenu = [
  const MenuItemModel(
    name: 'Big Mac',
    description:
        'Two beef patties, special sauce, lettuce, cheese, pickles, onions.',
    price: 160.0,
    imageUrl: _bigMacImg,
  ),
  const MenuItemModel(
    name: 'Quarter Pounder with Cheese',
    description: 'Fresh beef patty, melty cheese, onions, pickles.',
    price: 245.0,
    imageUrl: _quarterPounderImg,
  ),
  const MenuItemModel(
    name: 'McChicken',
    description: 'Crispy chicken patty, lettuce, creamy mayonnaise.',
    price: 135.0,
    imageUrl: _mcChickenImg,
  ),
  const MenuItemModel(
    name: 'Chicken McNuggets (6 pcs)',
    description: 'Bite-sized crispy chicken nuggets with your choice of dip.',
    price: 120.0,
    imageUrl: _nuggetsImg,
  ),
  const MenuItemModel(
    name: 'McFlurry Oreo',
    description: 'Soft vanilla ice cream blended with crunchy Oreo cookies.',
    price: 65.0,
    imageUrl: _mcFlurryImg,
  ),
];

final List<CategoryModel> mcDonaldsCategories = [
  const CategoryModel(name: 'Sandwiches', imageUrl: _bigMacImg),
  const CategoryModel(name: 'Meals', imageUrl: _friesImg),
  const CategoryModel(name: 'Sides & Sweets', imageUrl: _mcFlurryImg),
];

final Map<String, List<MenuItemModel>> categoryMenus = {
  'Sandwiches': [
    const MenuItemModel(
      name: 'Big Mac',
      description:
          'Two beef patties, special sauce, lettuce, cheese, pickles, onions.',
      price: 160.0,
      imageUrl: _bigMacImg,
    ),
    const MenuItemModel(
      name: 'McChicken',
      description: 'Crispy chicken patty, lettuce, creamy mayonnaise.',
      price: 135.0,
      imageUrl: _mcChickenImg,
    ),
    const MenuItemModel(
      name: 'Quarter Pounder with Cheese',
      description: 'Fresh beef patty, melty cheese, onions, pickles.',
      price: 245.0,
      imageUrl: _quarterPounderImg,
    ),
    const MenuItemModel(
      name: 'Filet-O-Fish',
      description: 'Crispy fish fillet, tartar sauce, half-slice cheese.',
      price: 150.0,
      imageUrl: _filetOFishImg,
    ),
    const MenuItemModel(
      name: 'McRib',
      description: 'Boneless pork patty, tangy BBQ sauce, onions, pickles.',
      price: 175.0,
      imageUrl: _mcRibImg,
    ),
    const MenuItemModel(
      name: 'Egg McMuffin',
      description: 'Egg, Canadian bacon, cheese on a toasted English muffin.',
      price: 95.0,
      imageUrl: _eggMcMuffinImg,
    ),
  ],
  'Meals': [
    const MenuItemModel(
      name: 'Big Mac Meal',
      description: 'Big Mac with medium fries and a medium soft drink.',
      price: 210.0,
      imageUrl: _bigMacImg,
    ),
    const MenuItemModel(
      name: 'Quarter Pounder Meal',
      description: 'Quarter Pounder with Cheese, fries and a soft drink.',
      price: 295.0,
      imageUrl: _quarterPounderImg,
    ),
    const MenuItemModel(
      name: 'Filet-O-Fish Meal',
      description: 'Filet-O-Fish, medium fries and a medium soft drink.',
      price: 200.0,
      imageUrl: _filetOFishImg,
    ),
  ],
  'Sides & Sweets': [
    const MenuItemModel(
      name: 'French Fries',
      description: 'Golden, crispy, salted world-famous fries.',
      price: 45.0,
      imageUrl: _friesImg,
    ),
    const MenuItemModel(
      name: 'Chicken McNuggets (6 pcs)',
      description: 'Bite-sized crispy chicken nuggets with your choice of dip.',
      price: 120.0,
      imageUrl: _nuggetsImg,
    ),
    const MenuItemModel(
      name: 'Apple Pie',
      description: 'Warm, flaky pastry filled with cinnamon apple.',
      price: 40.0,
      imageUrl: _applePieImg,
    ),
    const MenuItemModel(
      name: 'McFlurry Oreo',
      description: 'Soft vanilla ice cream blended with crunchy Oreo cookies.',
      price: 65.0,
      imageUrl: _mcFlurryImg,
    ),
  ],
};

final List<MenuItemModel> hotOfferItems = [
  const MenuItemModel(
    name: 'Big Mac Meal',
    description: 'Big Mac with medium fries and a medium soft drink.',
    price: 165.0,
    oldPrice: 210.0,
    imageUrl: _bigMacImg,
  ),
  const MenuItemModel(
    name: 'Nuggets Share Box (9 pcs)',
    description: 'Nine crispy nuggets, great for sharing, with two dips.',
    price: 140.0,
    oldPrice: 180.0,
    imageUrl: _nuggetsImg,
  ),
  const MenuItemModel(
    name: 'McChicken + McFlurry Combo',
    description: 'A McChicken sandwich paired with an Oreo McFlurry.',
    price: 175.0,
    oldPrice: 200.0,
    imageUrl: _mcChickenImg,
  ),
];
