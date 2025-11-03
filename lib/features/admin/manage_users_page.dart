import 'package:flutter/material.dart';

/// Gestion utilisateurs (squelette, mock activer/désactiver).
class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {'name': 'Amina', 'active': true},
      {'name': 'Youssef', 'active': false},
      {'name': 'Sara', 'active': true},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Gérer utilisateurs')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: users.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final u = users[i];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: SwitchListTile(
                title: Text(u['name'] as String, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                value: u['active'] as bool,
                onChanged: (_) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Statut modifié (mock)'))); },
              ),
            );
          },
        ),
      ),
    );
  }
}


