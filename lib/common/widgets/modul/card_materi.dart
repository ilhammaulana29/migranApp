// widgets/modul/card_materi.dart
import 'package:flutter/material.dart';
import 'materi.dart';

const Color primaryColor = Color(0xFFE8D915);
const Color secondaryColor = Color(0xFFD35400);
const Color warmGray = Color(0xFF8B7D6B);
const Color lightBeige = Color(0xFFF8F5F0);
const Color seaColor = Color(0xFF2196F3);
const Color landColor = Color(0xFF4CAF50);
const Color completedColor = Color(0xFF4CAF50);
const Color lockedColor = Color(0xFF9E9E9E);

class CardMateri extends StatelessWidget {
  final Materi materi;
  final int index;
  final VoidCallback onTap;
  final bool showStatus;

  const CardMateri({
    super.key,
    required this.materi,
    required this.index,
    required this.onTap,
    this.showStatus = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Number/Status Circle
                _buildStatusCircle(),
                const SizedBox(width: 16),
                
                // Content
                Expanded(
                  child: _buildContent(),
                ),
                
                // Action Arrow
                Icon(
                  Icons.chevron_right_rounded,
                  color: materi.isLocked ? lockedColor : secondaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCircle() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: materi.isCompleted
            ? completedColor.withOpacity(0.1)
            : materi.isLocked
                ? lockedColor.withOpacity(0.1)
                : primaryColor.withOpacity(0.1),
        border: Border.all(
          color: materi.isCompleted
              ? completedColor
              : materi.isLocked
                  ? lockedColor
                  : primaryColor,
          width: 2,
        ),
      ),
      child: Center(
        child: materi.isCompleted
            ? Icon(Icons.check_rounded, size: 20, color: completedColor)
            : materi.isLocked
                ? Icon(Icons.lock_rounded, size: 16, color: lockedColor)
                : Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: primaryColor,
                      fontSize: 16,
                    ),
                  ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                materi.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: materi.isLocked ? Colors.grey.shade600 : Colors.black87,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (showStatus && materi.isCompleted)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: completedColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'SELESAI',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: completedColor,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          materi.description,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        _buildMateriMeta(),
      ],
    );
  }

  Widget _buildMateriMeta() {
    return Row(
      children: [
        Icon(Icons.timer_outlined, size: 14, color: Colors.grey.shade500),
        const SizedBox(width: 4),
        Text(
          materi.duration,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(width: 16),
        if (materi.videoUrl != null)
          Row(
            children: [
              Icon(Icons.videocam_rounded, size: 14, color: seaColor),
              const SizedBox(width: 4),
              Text(
                'Video',
                style: TextStyle(
                  fontSize: 12,
                  color: seaColor,
                ),
              ),
            ],
          ),
        if (materi.pdfUrl != null)
          Row(
            children: [
              Icon(Icons.picture_as_pdf_rounded, size: 14, color: Colors.red),
              const SizedBox(width: 4),
              Text(
                'PDF',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ],
          ),
      ],
    );
  }
}