import 'package:flutter/material.dart';

class SimplePage extends StatelessWidget {
  final String title, description;
  final IconData icon;
  final List<String> items;

  const SimplePage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CircleAvatar(radius: 38, child: Icon(icon, size: 40)),
          const SizedBox(height: 18),
          Text(title, textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(description, textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700)),
          const SizedBox(height: 25),
          ...items.map((item) => Card(
            child: ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text(item),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          )),
        ],
      ),
    );
  }
}
