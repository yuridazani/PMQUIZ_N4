import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      // PERBAIKAN: Ganti withOpacity dengan withValues
      shadowColor: AppColors.orangeWheel.withValues(alpha: 0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [AppColors.orangeWheel, AppColors.coquelicot],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.babyPowder,
              child: Icon(Icons.person, size: 40, color: AppColors.coquelicot),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yurida Zani",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Informatika - Sem. 5",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 8),
                // Badge Status
                // Container kecil tidak perlu dipisah jadi widget sendiri 
                // kecuali dipakai di banyak tempat
              ],
            ),
          ],
        ),
      ),
    );
  }
}