import 'package:flutter/material.dart';
import '../widgets/project_card.dart';
import '../theme/colors.dart';
import '../features/investor/home_investor_page.dart';
import '../features/owner/home_owner_page.dart';
import '../features/admin/home_admin_page.dart';

class ProjectsFragment extends StatelessWidget {
  const ProjectsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {'title': 'Panneaux solaires Marrakech', 'energy': 'Solaire'},
      {'title': 'Mini-éolienne Agadir', 'energy': 'Éolienne'},
      {'title': 'Biogaz Fès', 'energy': 'Biogaz'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Projets disponibles'),
        backgroundColor: AppColors.primaryGreen,
        actions: [
          PopupMenuButton<String>(
            onSelected: (v) {
              if (v == 'investor') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeInvestorPage()));
              } else if (v == 'owner') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeOwnerPage()));
              } else if (v == 'admin') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeAdminPage()));
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'investor', child: Text('Espace Investisseur')),
              PopupMenuItem(value: 'owner', child: Text('Espace Porteur')),
              PopupMenuItem(value: 'admin', child: Text('Espace Admin')),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, i) {
          final p = projects[i];
          return ProjectCard(title: p['title']!, energy: p['energy']!);
        },
      ),
    );
  }
}
