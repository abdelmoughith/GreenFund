import 'package:flutter/foundation.dart';

/// Modèle représentant un projet d'énergie renouvelable.
@immutable
class Project {
  final String id;
  final String title;
  final String city;
  final String energyType; // e.g. Solaire, Éolienne, Biogaz
  final String description;
  final double targetAmount; // Objectif (MAD)
  final double raisedAmount; // Montant collecté (MAD)

  const Project({required this.id, required this.title, required this.city, required this.energyType, required this.description, required this.targetAmount, required this.raisedAmount});

  /// Progression entre 0 et 1, clampée.
  double get progress {
    if (targetAmount <= 0) return 0;
    final ratio = raisedAmount / targetAmount;
    if (ratio < 0) return 0;
    if (ratio > 1) return 1;
    return ratio;
  }

  Project copyWith({String? id, String? title, String? city, String? energyType, String? description, double? targetAmount, double? raisedAmount}) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      city: city ?? this.city,
      energyType: energyType ?? this.energyType,
      description: description ?? this.description,
      targetAmount: targetAmount ?? this.targetAmount,
      raisedAmount: raisedAmount ?? this.raisedAmount,
    );
  }
}


