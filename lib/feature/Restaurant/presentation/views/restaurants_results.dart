import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:shopix_user/core/localization/app_strings.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/category_list.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/custom_appbar.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/empty.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/restaurans_list.dart';
import 'package:shopix_user/feature/Restaurant/presentation/widgets/restaurants_view/search_bar.dart';

enum ResultsMode { favorites, category, search, seeall }

class RestaurantResultModel {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String deliveryTime;
  final double distanceKm;
  final List<String> categories;
  bool isFavorite;

  RestaurantResultModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.deliveryTime,
    required this.distanceKm,
    required this.categories,
    this.isFavorite = false,
  });
}

final List<RestaurantResultModel> demoRestaurants = [
  RestaurantResultModel(
    id: '1',
    name: "Buffalo Burger",
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr7k3_2DZ2mDM_hW9D1kLyXYcNRhQ5R0ZFJxYN9brmMpFVPzsHI6U8RgMh&s=10',
    rating: 4.8,
    deliveryTime: '20-30 ',
    distanceKm: 1.2,
    categories: const ['Burgers', 'Desserts'],
    isFavorite: true,
  ),
  RestaurantResultModel(
    id: '2',
    name: 'MCdonalds',
    imageUrl:
        'https://www.mcdonalds.eg/Cms_Data/Contents/Ar/Media/ChickenLTO2026/AR-640x470.jpg',
    rating: 4.5,
    deliveryTime: '25-35 ',
    distanceKm: 2.1,
    categories: const ['Burgers'],
  ),
  RestaurantResultModel(
    id: '3',
    name: 'Kfc',
    imageUrl:
        'https://eg-24.com/wp-content/uploads/2026/04/%D9%85%D9%86%D9%8A%D9%88-%D9%83%D9%86%D8%AA%D8%A7%D9%83%D9%8A-%D9%85%D8%B7%D8%B9%D9%85-%D9%82%D8%A7%D8%A6%D9%85%D8%A9-%D8%A7%D9%84%D8%AC%D8%AF%D9%8A%D8%AF-%D8%B1%D9%82%D9%85-%D8%A7%D9%84%D8%A3%D8%B3%D8%B9%D8%A7%D8%B1-%D8%A7%D9%84%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%D8%A9-%D8%B9%D8%B1%D8%A8%D9%8A-KFC-Menu-prices-updated-2024-1.webp',
    rating: 4.4,
    deliveryTime: '15-25 ',
    distanceKm: 0.9,
    categories: const ['Burgers'],
  ),
  RestaurantResultModel(
    id: '4',
    name: 'Pizza Hut',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfZF6l9byfmuUuzt-mNHHTHItzaKytgbgkFEdQ8OAK2OKEVykaW2h3_Hnb&s=10',
    rating: 4.6,
    deliveryTime: '25-35 ',
    distanceKm: 1.7,
    categories: const ['Pizza'],
    isFavorite: true,
  ),
  RestaurantResultModel(
    id: '5',
    name: 'Papa Johns',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-psGkbbSoZZh42gOy4J0NYCVd8471jwEyW3ZTF-zM6bdjXHKZzCkHMbvt&s=10',
    rating: 4.3,
    deliveryTime: '30-40 ',
    distanceKm: 3.0,
    categories: const ['Pizza'],
  ),
  RestaurantResultModel(
    id: '6',
    name: "Hardee's",
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReHNr0RkE4nEFxpUdhHtXyCxQ15h_R-PfbMrgru1XCjw&s=10',
    rating: 4.2,
    deliveryTime: '20-30 ',
    distanceKm: 2.4,
    categories: const ['Burgers'],
  ),
  RestaurantResultModel(
    id: '7',
    name: 'Bazooka',
    imageUrl: 'https://dalilzag.com//uploads/2023/03/v7IPEztJCxuWnAFKlZyR.jpg',
    rating: 4.1,
    deliveryTime: '20-30 ',
    distanceKm: 1.5,
    categories: const ['Seafood'],
  ),
  RestaurantResultModel(
    id: '8',
    name: 'Cinnabon',
    imageUrl:
        'https://images.deliveryhero.io/image/hungerstation/restaurant/android_cover_photo/0a50dd8d8a5b541abfc4bfa1a33c24d6.jpg',
    rating: 4.7,
    deliveryTime: '15-25 ',
    distanceKm: 1.0,
    categories: const ['Desserts', 'Bakery'],
  ),
];

class RestaurantsResultsView extends StatefulWidget {
  final ResultsMode mode;
  final String? initialCategory;
  final String? initialCatgoryKey;
  final String? initialQuery;

  const RestaurantsResultsView({
    super.key,
    required this.mode,
    this.initialCategory,
    this.initialQuery,
    this.initialCatgoryKey,
  });

  @override
  State<RestaurantsResultsView> createState() => _RestaurantsResultsViewState();
}

class _RestaurantsResultsViewState extends State<RestaurantsResultsView> {
  late String? selectedCategory = widget.initialCategory;
  late String? selectedCategorykey = widget.initialCatgoryKey;
  late final TextEditingController searchController = TextEditingController(
    text: widget.initialQuery,
  );
  String query = '';
  Timer? _debounce;
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<double> _collapseT = ValueNotifier(0);
  static final double _expandedHeight = 120.h;

  void _handleScroll() {
    final maxShrink = (_expandedHeight.h - kToolbarHeight).clamp(
      1.0,
      double.infinity,
    );
    final t = (_scrollController.offset / maxShrink).clamp(0.0, 1.0);
    if (t != _collapseT.value) _collapseT.value = t;
  }

  static const String _all = 'All';

  static const _allCategories = [
    _all,
    'Burgers',
    'Pizza',
    'Desserts',
    'Drinks',
    'Bakery',
    'Seafood',
  ];

  @override
  void initState() {
    super.initState();
    query = widget.initialQuery ?? '';
    selectedCategory ??= _all;
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _collapseT.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () {
      setState(() => query = value);
    });
  }

  List<RestaurantResultModel> get _filtered {
    switch (widget.mode) {
      case ResultsMode.favorites:
        return demoRestaurants.where((r) => r.isFavorite).toList();

      case ResultsMode.category:
        if (selectedCategory == null || selectedCategory == _all) {
          return demoRestaurants;
        }
        return demoRestaurants
            .where((r) => r.categories.contains(selectedCategory))
            .toList();

      case ResultsMode.search:
        if (query.trim().isEmpty) return const [];
        return demoRestaurants
            .where(
              (r) => r.name.toLowerCase().contains(query.trim().toLowerCase()),
            )
            .toList();

      case ResultsMode.seeall:
        Iterable<RestaurantResultModel> list = demoRestaurants;

        if (selectedCategory != null && selectedCategory != _all) {
          list = list.where((r) => r.categories.contains(selectedCategory));
        }

        final q = query.trim().toLowerCase();
        if (q.isNotEmpty) {
          list = list.where((r) => r.name.toLowerCase().contains(q));
        }

        return list.toList();
    }
  }

  String _title(BuildContext context) {
    switch (widget.mode) {
      case ResultsMode.favorites:
        return context.tr("restaurant_results.your_favorites");
      case ResultsMode.category:
        return context.tr(
          selectedCategorykey ?? "restaurant_results.categories_title",
        );
      case ResultsMode.search:
        return context.tr("restaurant_results.search_title");
      case ResultsMode.seeall:
        return context.tr("restaurant_results.all_restaurants");
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final results = _filtered;
    final Map<String, String> allCategorieskeys = {
      'All': 'restaurant_results.all',
      'Burgers': 'home.category_burgers',
      'Pizza': 'home.category_pizza',
      'Desserts': 'home.category_desserts',
      'Drinks': 'home.category_drinks',
      'Bakery': 'home.category_bakery',
      'Seafood': 'home.category_seafood',
    };
    final allCategorieslabel = [
      context.tr("restaurant_results.all"),
      context.tr("home.category_burgers"),
      context.tr("home.category_pizza"),
      context.tr("home.category_desserts"),
      context.tr("home.category_drinks"),
      context.tr("home.category_bakery"),
      context.tr("home.category_seafood"),
    ];
    return Scaffold(
      backgroundColor: scheme.surface,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const ScrollPhysics(),
        slivers: [
          CustomRestaurantsAppBar(
            expandedHeight: _expandedHeight,
            scheme: scheme,
            widget: widget,
            collapseT: _collapseT,
            title: _title(context),
          ),

          if (widget.mode == ResultsMode.category ||
              widget.mode == ResultsMode.seeall)
            CategoryList(
              allCategorieslabel: allCategorieslabel,
              allCategories: _allCategories,
              selectedCategory: selectedCategory,
              all: _all,

              ontap: (category) => setState(() {
                selectedCategory = category;
                selectedCategorykey = allCategorieskeys[category];
              }),
            ),
          SliverToBoxAdapter(child: SizedBox(height: 4.h)),
          if (widget.mode == ResultsMode.search ||
              widget.mode == ResultsMode.seeall)
            CustomSearchBar(
              onSearchChanged: _onSearchChanged,
              searchController: searchController,
              mode: widget.mode,
            ),

          SliverToBoxAdapter(child: SizedBox(height: 8.h)),

          if (results.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Empty(mode: widget.mode, query: query),
            )
          else
            ReataurantsList(
              results: results,
              onToggleFavorite: (restaurant) {
                setState(() {
                  restaurant.isFavorite = !restaurant.isFavorite;
                });
              },
            ),
          if (widget.mode == ResultsMode.favorites)
            SliverPadding(padding: EdgeInsets.only(bottom: 50.h)),
        ],
      ),
    );
  }
}
