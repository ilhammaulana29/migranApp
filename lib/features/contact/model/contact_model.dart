import 'package:flutter/material.dart';

class ContactModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String content;

  ContactModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.content,
  });
}
