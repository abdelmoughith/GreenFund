import 'package:flutter/material.dart';
import '../../widgets/green_button.dart';
import '../../widgets/green_text_field.dart';

/// Création de projet (UI, mock).
class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _city = TextEditingController();
  final _target = TextEditingController();
  String _energy = 'Solaire';

  @override
  void dispose() {
    _title.dispose();
    _city.dispose();
    _target.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO: API create project
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Projet créé (mock)')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Créer un projet')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GreenTextField(controller: _title, label: 'Titre', validator: (v) => (v==null||v.isEmpty)?'Titre requis':null),
              const SizedBox(height: 12),
              GreenTextField(controller: _city, label: 'Ville', validator: (v) => (v==null||v.isEmpty)?'Ville requise':null),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _energy,
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Type d\'énergie'),
                items: const [
                  DropdownMenuItem(value: 'Solaire', child: Text('Solaire')),
                  DropdownMenuItem(value: 'Éolienne', child: Text('Éolienne')),
                  DropdownMenuItem(value: 'Biogaz', child: Text('Biogaz')),
                ],
                onChanged: (v) => setState(() => _energy = v ?? 'Solaire'),
              ),
              const SizedBox(height: 12),
              GreenTextField(
                controller: _target,
                label: 'Objectif (MAD)',
                keyboardType: TextInputType.number,
                validator: (v) => (double.tryParse((v??'').replaceAll(',', '.')) == null) ? 'Montant invalide' : null,
              ),
              const SizedBox(height: 16),
              GreenButton(onPressed: _submit, child: const Text('Soumettre')),
            ],
          ),
        ),
      ),
    );
  }
}


