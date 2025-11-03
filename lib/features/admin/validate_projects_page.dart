import 'package:flutter/material.dart';

/// Liste de projets en attente avec actions mock Accepter/Refuser.
class ValidateProjectsPage extends StatelessWidget {
  const ValidateProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pending = const [
      {'title': 'Solaire - Rabat', 'owner': 'Coop A'},
      {'title': 'Éolienne - Essaouira', 'owner': 'Association B'},
      {'title': 'Biogaz - Meknès', 'owner': 'Startup C'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Valider projets')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: pending.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final p = pending[i];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(p['title'] as String, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text('Porteur: ${p['owner']}'),
                trailing: Wrap(spacing: 8, children: [
                  TextButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Refusé (mock)'))); }, child: const Text('Refuser')),
                  TextButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Accepté (mock)'))); }, child: const Text('Accepter')),
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}


