// widgets/modul/card_resource.dart
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFE8D915);
const Color secondaryColor = Color(0xFFD35400);
const Color warmGray = Color(0xFF8B7D6B);
const Color lightBeige = Color(0xFFF8F5F0);
const Color seaColor = Color(0xFF2196F3);
const Color landColor = Color(0xFF4CAF50);
const Color completedColor = Color(0xFF4CAF50);
const Color lockedColor = Color(0xFF9E9E9E);

class CardResource extends StatelessWidget {
  final Map<String, String> resource;
  final VoidCallback onDownload;

  const CardResource({
    super.key,
    required this.resource,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildIcon(),
              const SizedBox(width: 16),
              Expanded(
                child: _buildInfo(),
              ),
              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    final iconColor = resource['type'] == 'PDF'
        ? Colors.red
        : resource['type'] == 'Video'
            ? seaColor
            : primaryColor;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        resource['type'] == 'PDF'
            ? Icons.picture_as_pdf_rounded
            : resource['type'] == 'Video'
                ? Icons.videocam_rounded
                : Icons.link_rounded,
        color: iconColor,
        size: 24,
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          resource['name']!,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          resource['type'] == 'Link'
              ? resource['url']!
              : resource['type'] == 'Video'
                  ? 'Duration: ${resource['duration']}'
                  : 'Size: ${resource['size']}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return IconButton(
      icon: resource['type'] == 'Link'
          ? Icon(Icons.open_in_new_rounded, color: primaryColor)
          : Icon(Icons.download_rounded, color: secondaryColor),
      onPressed: onDownload,
    );
  }
}