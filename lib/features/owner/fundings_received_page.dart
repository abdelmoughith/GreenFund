import 'package:flutter/material.dart';

/// Liste des financements reçus (squelette, mock).
class FundingsReceivedPage extends StatelessWidget {
  const FundingsReceivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = const [
      {'project': 'Panneaux solaires - Marrakech', 'amount': 45000.0},
      {'project': 'Mini-éolienne - Agadir', 'amount': 30000.0},
      {'project': 'Unité biogaz - Fès', 'amount': 90000.0},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Financements reçus')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: data.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final it = data[i];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(it['project'] as String, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text('Collecté: ${(it['amount'] as double).toStringAsFixed(0)} MAD'),
              ),
            );
          },
        ),
      ),
    );
  }
}


