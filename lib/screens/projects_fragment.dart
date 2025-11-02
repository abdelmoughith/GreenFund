import 'package:flutter/material.dart';
import '../widgets/project_card.dart';
import '../theme/colors.dart';

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
