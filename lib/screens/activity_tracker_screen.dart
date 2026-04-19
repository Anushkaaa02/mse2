import 'package:flutter/material.dart';

class ActivityTrackerScreen extends StatefulWidget {
  const ActivityTrackerScreen({super.key});

  @override
  State<ActivityTrackerScreen> createState() => _ActivityTrackerScreenState();
}

class _ActivityTrackerScreenState extends State<ActivityTrackerScreen> {
  final List<Map<String, dynamic>> _activities = [
    {'name': 'Running', 'duration': '30 mins', 'completed': false},
    {'name': 'Walking', 'duration': '45 mins', 'completed': false},
    {'name': 'Cycling', 'duration': '60 mins', 'completed': false},
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  void _addActivity() {
    if (_nameController.text.isNotEmpty && _durationController.text.isNotEmpty) {
      setState(() {
        _activities.add({
          'name': _nameController.text,
          'duration': _durationController.text,
          'completed': false,
        });
      });
      _nameController.clear();
      _durationController.clear();
      Navigator.of(context).pop();
    }
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const Text('Add Activity'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Activity Name'),
              ),
              TextField(
                controller: _durationController,
                decoration: const InputDecoration(labelText: 'Duration'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _addActivity,
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _activities.length,
        itemBuilder: (context, index) {
          final activity = _activities[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                activity['completed'] = !activity['completed'];
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: activity['completed']
                    ? Colors.green.withOpacity(0.3)
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: activity['completed'] ? Colors.green : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: activity['completed'] ? Colors.green : Theme.of(context).colorScheme.primary,
                  child: Icon(
                    activity['completed'] ? Icons.check : Icons.directions_run,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  activity['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: activity['completed'] ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(activity['duration']),
                trailing: activity['completed']
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
