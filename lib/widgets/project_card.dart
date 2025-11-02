import 'package:flutter/material.dart';
import '../theme/styles.dart';
import '../theme/colors.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String energy;

  const ProjectCard({super.key, required this.title, required this.energy});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppStyles.projectCardTheme.shape,
      elevation: AppStyles.projectCardTheme.elevation,
      margin: AppStyles.projectCardTheme.margin,
      child: ListTile(
        leading: const Icon(Icons.energy_savings_leaf, color: AppColors.primaryGreen),
        title: Text(title, style: AppStyles.titleText),
        subtitle: Text('Type d’énergie : $energy', style: AppStyles.subtitleText),
        trailing: TextButton(
          onPressed: () {},
          child: const Text('Voir', style: TextStyle(color: AppColors.primaryGreen)),
        ),
      ),
    );
  }
}
