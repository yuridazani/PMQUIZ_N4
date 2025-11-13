import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class ActivityItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final bool isHighPriority;

  const ActivityItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isHighPriority = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          // PERBAIKAN: Hapus const karena .withValues()
          color: AppColors.khaki.withValues(alpha: 0.2),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // PERBAIKAN: Gunakan withValues(alpha: ...)
            color: isHighPriority
                ? AppColors.coquelicot.withValues(alpha: 0.1)
                : Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isHighPriority
                ? Icons.priority_high_rounded
                : Icons.history_rounded,
            color: isHighPriority ? AppColors.coquelicot : Colors.grey,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        trailing: Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.khaki,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}