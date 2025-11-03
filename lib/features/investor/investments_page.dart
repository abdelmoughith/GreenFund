import 'package:flutter/material.dart';

/// Liste des investissements (mock).
class InvestmentsPage extends StatelessWidget {
  const InvestmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      {'project': 'Panneaux solaires - Marrakech', 'amount': 2000.0},
      {'project': 'Mini-éolienne - Agadir', 'amount': 1500.0},
      {'project': 'Unité biogaz - Fès', 'amount': 3000.0},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mes investissements')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final it = items[i];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(it['project'] as String, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text('${(it['amount'] as double).toStringAsFixed(0)} MAD'),
              ),
            );
          },
        ),
      ),
    );
  }
}


