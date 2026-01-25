import 'package:flutter/material.dart';

class Module {
  final int id;
  final String title;
  final String description;
  final String duration;
  final String difficulty;
  final int progress;
  final IconData icon;
  final String imageUrl;
  final int lessons;

  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.difficulty,
    required this.progress,
    required this.icon,
    required this.imageUrl,
    required this.lessons,
  });
}