import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewWidget extends StatelessWidget {
  final List<GridTileData> items;

  const GridViewWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        itemCount: items.length,
        itemBuilder: (context, index) => GridTile(
          title: items[index].title,
          content: items[index].content,
        ),
      ),
    );
  }
}

class GridTileData {
  final String title;
  final String content;

  GridTileData({required this.title, required this.content});
}

class GridTile extends StatelessWidget {
  final String title;
  final String content;

  const GridTile({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(content,
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}