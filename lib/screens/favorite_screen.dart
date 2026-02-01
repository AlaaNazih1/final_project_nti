import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/provider/favoret_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites=context.watch<FavoriteProvider>().favorites;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Screen'),
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorite items'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
               return Card(
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Image.network(
                      item.image,
                      width: 50,
                      height: 50,
                      
                    ),
                    title: Text(item.title),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        context
                            .read<FavoriteProvider>()
                            .toggleFavorite(item);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}