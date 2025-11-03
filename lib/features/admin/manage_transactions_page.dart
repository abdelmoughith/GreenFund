import 'package:flutter/material.dart';

/// Transactions (squelette, mock).
class ManageTransactionsPage extends StatelessWidget {
  const ManageTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final txs = const [
      {'id': '#TX1001', 'user': 'Amina', 'amount': 1200.0},
      {'id': '#TX1002', 'user': 'Youssef', 'amount': 800.0},
      {'id': '#TX1003', 'user': 'Sara', 'amount': 1500.0},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: txs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final t = txs[i];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text('${t['id']} • ${(t['amount'] as double).toStringAsFixed(0)} MAD', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text('Utilisateur: ${t['user']}'),
                trailing: const Text('Voir'),
              ),
            );
          },
        ),
      ),
    );
  }
}


