import 'package:flutter/material.dart';
import 'tip_detail_screen.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  final List<Map<String, String>> _tips = const [
    {
      'id': '1',
      'title': 'Stay Hydrated',
      'description': 'Drinking enough water is crucial for your health. Aim for at least 8 glasses a day to keep your body functioning optimally.',
      'icon': 'water_drop',
    },
    {
      'id': '2',
      'title': 'Consistent Sleep',
      'description': 'Getting 7-9 hours of sleep helps muscle recovery and keeps your metabolism healthy.',
      'icon': 'bedtime',
    },
    {
      'id': '3',
      'title': 'Balanced Diet',
      'description': 'Incorporate lean proteins, healthy fats, and complex carbohydrates into your meals.',
      'icon': 'restaurant',
    },
    {
      'id': '4',
      'title': 'Daily Movement',
      'description': 'Even if you don\'t do a full workout, try to walk or stretch for at least 30 minutes every day.',
      'icon': 'directions_walk',
    },
  ];

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
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.85,
      ),
      itemCount: _tips.length,
      itemBuilder: (context, index) {
        final tip = _tips[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TipDetailScreen(tip: tip),
              ),
            );
          },
          child: Card(
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'tip_icon_${tip['id']}',
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                      child: Icon(_getIcon(tip['icon']!), size: 30, color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    tip['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
