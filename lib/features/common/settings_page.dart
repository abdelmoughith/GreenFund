import 'package:flutter/material.dart';

/// Paramètres (squelette): dark mode mock, langue FR/EN, notifications TODO, déconnexion TODO.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  String _lang = 'FR';

  void _chooseLanguage() async {
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) {
        String? selected = _lang;
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            title: const Text('Choisir la langue'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<String>(
                  title: const Text('Français'),
                  value: 'FR',
                  groupValue: selected,
                  onChanged: (v) {
                    setState(() => selected = v);
                    Navigator.pop(ctx, v);
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Anglais'),
                  value: 'EN',
                  groupValue: selected,
                  onChanged: (v) {
                    setState(() => selected = v);
                    Navigator.pop(ctx, v);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
    if (result != null) {
      setState(() => _lang = result);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Langue réglée sur $_lang (mock)')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SwitchListTile(
              title: const Text('Mode sombre'),
              value: _darkMode,
              onChanged: (v) {
                setState(() => _darkMode = v);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Mode sombre basculé (mock)')));
              },
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: const Text('Langue'),
              subtitle: Text(_lang == 'FR' ? 'Français' : 'Anglais'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _chooseLanguage,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              title: Text('Notifications'),
              subtitle: Text('À venir'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              title: Text('Déconnexion'),
              subtitle: Text('TODO'),
            ),
          ),
        ],
      ),
    );
  }
}


