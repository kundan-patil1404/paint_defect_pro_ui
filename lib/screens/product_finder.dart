import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import '../utils/responsive.dart';

class ProductFinderScreen extends StatefulWidget {
  const ProductFinderScreen({super.key});

  @override
  State<ProductFinderScreen> createState() => _ProductFinderScreenState();
}

class _ProductFinderScreenState extends State<ProductFinderScreen> {
  int selectedCategory = 0;

  final categories = [
    'All',
    'Exterior',
    'Interior',
    'Primers',
  ];

  final products = [
    _ProductData(
      'assets/images/products/evershield.png',
      'EVERSHIELD® Exterior',
      '100% Acrylic Flat Paint',
      '1 Gallon',
      '\$68.50',
      'Exterior',
    ),
    _ProductData(
      'assets/images/products/sparmx.png',
      'SPARX™ Waterborne',
      'Premium Interior Semi-Gloss',
      '1 Gallon',
      '\$54.95',
      'Interior',
    ),
    _ProductData(
      'assets/images/products/aristoshield.png',
      'ARISTOSHIELD® Ultra',
      'High-Performance Urethane Gloss',
      '1 Gallon',
      '\$78.00',
      'Exterior',
    ),
    _ProductData(
      'assets/images/products/eff_stop.png',
      'EFF-STOP® Select',
      'Exterior Masonry Primer',
      '5 Gallon',
      '\$185.00',
      'Primers',
    ),
  ];

  List<_ProductData> get filteredProducts {
    if (selectedCategory == 0) {
      return products;
    }

    final category = categories[selectedCategory];

    return products.where((product) => product.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            _buildCategories(context),
            _buildProductList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      color: AppColors.darkBackground,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.w(context, 20),
        vertical: Responsive.h(context, 20)
      ),
      child: Column(
        children: [
          Row(
            children: [
              BackButton(color: Colors.white,),
              Text(
                'Product Finder',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Responsive.sp(context, 18),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/bell_icon.svg',

                width: Responsive.icon(context, 18),
                height: Responsive.icon(context, 18),
              ),

              SizedBox(
                width: Responsive.w(context, 17),
              ),

              SvgPicture.asset(
                'assets/icons/person.svg',
                width: Responsive.icon(context, 18),
                height: Responsive.icon(context, 18),
              ),
            ],
          ),
          SizedBox(height: Responsive.h(context, 20),),
          _buildSearchBar(context)
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      color: AppColors.darkBackground,
      child: Container(
        height: Responsive.h(context, 38),
        decoration: BoxDecoration(
          color: const Color(0xFF171918),
          border: Border.all(
            color: const Color(0xFF484848),
            width: Responsive.w(context, 1),
          ),
          borderRadius: BorderRadius.circular(
            Responsive.r(context, 22),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: Responsive.w(context, 12),
            ),
            Icon(
              Icons.search,
              color: Colors.white54,
              size: Responsive.icon(context, 19),
            ),
            SizedBox(
              width: Responsive.w(context, 8),
            ),
            Expanded(
              child: Text(
                'Search Dunn-Edwards Paint lines...',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: Responsive.sp(context, 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return Container(
      height: Responsive.h(context, 51),
      padding: EdgeInsets.only(
        left: Responsive.w(context, 20),
        top: Responsive.h(context, 11),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) {
          return SizedBox(
            width: Responsive.w(context, 9),
          );
        },
        itemBuilder: (context, index) {
          final selected = selectedCategory == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              height: Responsive.h(context, 15),
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.w(context, 20),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  Responsive.r(context, 25),
                ),
                border: Border.all(
                  color: selected
                      ? AppColors.primaryOrange
                      : const Color(0xFFE0DED7),
                  width: Responsive.w(context, 1),
                ),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: Responsive.sp(context, 12),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    final items = filteredProducts;

    return Expanded(
      child: ListView(
        padding: EdgeInsets.fromLTRB(
          Responsive.w(context, 20),
          Responsive.h(context, 0),
          Responsive.w(context, 20),
          Responsive.h(context, 20),
        ),
        children: [
          SizedBox(height: Responsive.h(context, 10),),
          Text(
            'RECOMMENDED PAINTS (${items.length})',
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: Responsive.sp(context, 12),
              fontWeight: FontWeight.bold,
              letterSpacing: Responsive.sp(context, 0.5),
            ),
          ),
          SizedBox(
            height: Responsive.h(context, 10),
          ),
          ...items.map(
            (product) => Padding(
              padding: EdgeInsets.only(
                bottom: Responsive.h(context, 10),
              ),
              child: _ProductCard(
                product: product,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final _ProductData product;

  const _ProductCard({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.h(context, 112),
      padding: EdgeInsets.all(
        Responsive.w(context, 12),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          Responsive.r(context, 10),
        ),
        border: Border.all(
          color: const Color(0xFFE2E0DA),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: Responsive.w(context, 74),
            height: Responsive.h(context, 82),
            padding: EdgeInsets.all(
              Responsive.w(context, 5),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F2),
              borderRadius: BorderRadius.circular(
                Responsive.r(context, 7),
              ),
              border: Border.all(
                color: const Color(0xFFDAD8D1),
              ),
            ),
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: Responsive.w(context, 12),
          ),
          Container(
            height: Responsive.h(context, 82),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: Responsive.sp(context, 14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Responsive.h(context, 4),
                ),
                Text(
                  product.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: Responsive.sp(context, 11),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: Responsive.h(context, 3),
                ),
                Text(
                  'Size: ${product.size}',
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: Responsive.sp(context, 10),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: Responsive.w(context, 213),
                  child: Row(
                    children: [
                      Text(
                        product.price,
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: Responsive.sp(context, 16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                          width: Responsive.w(context, 62),
                          height: Responsive.h(context, 27),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColors.primaryOrange,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Responsive.r(context, 8),
                                ),
                              ),
                            ),
                            child: Text(
                              'ADD +',
                              style: TextStyle(
                                fontSize: Responsive.sp(context, 11),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Responsive.w(context, 8),
          ),

        ],
      ),
    );
  }
}

class _ProductData {
  final String image;
  final String name;
  final String description;
  final String size;
  final String price;
  final String category;

  const _ProductData(
    this.image,
    this.name,
    this.description,
    this.size,
    this.price,
    this.category,
  );
}
