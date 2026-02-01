import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/api/my_api_services.dart';
import 'package:provider_task/model/product.dart';
import 'package:provider_task/l10n/app_localizations.dart';
import 'package:provider_task/model/cart_model.dart';
import 'package:provider_task/provider/cart_provider.dart';
import 'package:provider_task/provider/favoret_provider.dart';
import 'package:provider_task/provider/localization_provider.dart';
import 'package:provider_task/provider/theme_provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String? _errorMessage;
  final AppPiServices _apiServices = AppPiServices();
  List<ProductData> _myProducts = [];
  @override
  void initState() {
    _loadProducts();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF6F00),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              context.read<LocalizationProvider>().changeLanguage(
                context.read<LocalizationProvider>().locale.languageCode == 'en'
                    ? 'ar'
                    : 'en',
              );
            },
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().changeTheme();
            },
            icon: Icon(
              context.watch<ThemeProvider>().themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadProducts,
              child: const Text('try again'),
            ),
          ],
        ),
      );
    }
    // Default widget if there is no error
    return RefreshIndicator(
      onRefresh: _loadProducts,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _myProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),

        itemBuilder: (context, index) {
          final product = _myProducts[index];
          return _buildPostCard(
            ProductData(
              id: product.id,
              title: product.title,
              price: product.price,
              description: product.description,
              category: product.category,
              image: product.image,
            ),
          );
        },
      ),
    );
  }

  Future<void> _loadProducts() async {
    final result = await _apiServices.getProducts();
    setState(() {
      _myProducts = result ?? [];
      _errorMessage = null;
    });
  }

  Widget _buildPostCard(ProductData product) {
    return Card(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      product.image,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Consumer<FavoriteProvider>(
                      builder: (context, favProvider, _) {
                        final isFav = favProvider.isFavorite(product);
                        return IconButton(
                          onPressed: () {
                            favProvider.toggleFavorite(product);
                          },
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),

            Text(
              product.title,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              product.description,
              maxLines: 2,
              style: const TextStyle(fontSize: 12),
            ),
            Spacer(),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartProvider>().addToCart(
                    CartItem(
                      title: product.title,
                      description: product.description,
                      price: product.price,
                      image: product.image,
                    ),
                  );
                },
                child: Text(AppLocalizations.of(context)!.add_to_cart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
