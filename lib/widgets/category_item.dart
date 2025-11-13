import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
            border: Border.all(
              // PERBAIKAN: Hapus const karena .withValues()
              color: AppColors.khaki.withValues(alpha: 0.3),
            ),
          ),
          child: Icon(icon, color: AppColors.orangeWheel, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}