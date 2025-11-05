import 'package:flutter/material.dart';
import '../../widgets/green_button.dart';
import 'create_project_page.dart';
import 'edit_project_page.dart';
import 'fundings_received_page.dart';

/// Accueil Porteur: navigation vers les écrans du module.
class HomeOwnerPage extends StatelessWidget {
  const HomeOwnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Espace Porteur')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GreenButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateProjectPage())), child: const Text('Créer un projet')),
            const SizedBox(height: 12),
            GreenButton(outlined: true, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProjectPage())), child: const Text('Modifier un projet')),
            const SizedBox(height: 12),
            GreenButton(outlined: true, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FundingsReceivedPage())), child: const Text('Financements reçus')),
          ],
        ),
      ),
    );
  }
}


