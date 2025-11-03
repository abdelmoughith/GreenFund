import 'package:flutter/material.dart';
import '../../models/project.dart';
import '../../widgets/green_button.dart';
import '../common/profile_page.dart';
import '../common/settings_page.dart';
import 'investments_page.dart';
import 'project_detail_page.dart';

/// Accueil investisseur avec NavigationBar (Projets / Compte) et liste mock.
class HomeInvestorPage extends StatefulWidget {
  const HomeInvestorPage({super.key});

  @override
  State<HomeInvestorPage> createState() => _HomeInvestorPageState();
}

class _HomeInvestorPageState extends State<HomeInvestorPage> {
  int _index = 0;

  late final List<Project> _projects = [
    const Project(
      id: 'p1',
      title: 'Panneaux solaires - Marrakech',
      city: 'Marrakech',
      energyType: 'Solaire',
      description: 'Installation de 50 panneaux sur toits résidentiels.',
      targetAmount: 120000,
      raisedAmount: 45000,
    ),
    const Project(
      id: 'p2',
      title: 'Mini-éolienne - Agadir',
      city: 'Agadir',
      energyType: 'Éolienne',
      description: 'Éolienne 5kW pour ferme coopérative.',
      targetAmount: 80000,
      raisedAmount: 30000,
    ),
    const Project(
      id: 'p3',
      title: 'Unité biogaz - Fès',
      city: 'Fès',
      energyType: 'Biogaz',
      description: 'Valorisation des déchets organiques en énergie.',
      targetAmount: 150000,
      raisedAmount: 90000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      _ProjectsList(projects: _projects),
      _AccountMenu(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GreenFund'),
        actions: [
          IconButton(
            tooltip: 'Investissements',
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InvestmentsPage())),
            icon: const Icon(Icons.trending_up),
          ),
          PopupMenuButton<String>(
            onSelected: (v) {
              if (v == 'profile') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
              } else if (v == 'settings') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()));
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'profile', child: Text('Profil')),
              PopupMenuItem(value: 'settings', child: Text('Paramètres')),
            ],
          ),
        ],
      ),
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.bolt), label: 'Projets'),
          NavigationDestination(icon: Icon(Icons.account_circle), label: 'Compte'),
        ],
        onDestinationSelected: (i) => setState(() => _index = i),
      ),
    );
  }
}

class _ProjectsList extends StatelessWidget {
  final List<Project> projects;
  const _ProjectsList({required this.projects});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: projects.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final p = projects[i];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProjectDetailPage(project: p)));
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(p.title, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      subtitle: Text('${p.energyType} • ${p.city}', style: textTheme.bodySmall),
                      trailing: const Text('Voir'),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: p.progress),
                    const SizedBox(height: 8),
                    Text('${p.raisedAmount.toStringAsFixed(0)} / ${p.targetAmount.toStringAsFixed(0)} MAD', style: textTheme.bodySmall),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GreenButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage())), child: const Text('Profil')),
          const SizedBox(height: 12),
          GreenButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())), child: const Text('Paramètres')),
          const SizedBox(height: 12),
          GreenButton(outlined: true, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InvestmentsPage())), child: const Text('Mes investissements')),
        ],
      ),
    );
  }
}


