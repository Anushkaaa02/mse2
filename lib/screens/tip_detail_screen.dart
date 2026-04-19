import 'package:flutter/material.dart';

class TipDetailScreen extends StatelessWidget {
  final Map<String, String> tip;

  const TipDetailScreen({super.key, required this.tip});

  IconData _getIcon(String name) {
    switch (name) {
      case 'water_drop':
        return Icons.water_drop;
      case 'bedtime':
        return Icons.bedtime;
      case 'restaurant':
        return Icons.restaurant;
      case 'directions_walk':
        return Icons.directions_walk;
      default:
        return Icons.lightbulb;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tip['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Hero(
              tag: 'tip_icon_${tip['id']}',
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                child: Icon(_getIcon(tip['icon']!), size: 60, color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              tip['title']!,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              tip['description']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.white70, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
