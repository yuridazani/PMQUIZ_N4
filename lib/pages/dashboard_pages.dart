import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/profile_card.dart';
import '../widgets/category_item.dart';
import '../widgets/activity_item.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.babyPowder,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // PERBAIKAN: Gunakan withValues
                color: AppColors.orangeWheel.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.school, color: AppColors.orangeWheel),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(color: AppColors.khaki, fontSize: 12),
                ),
                Text(
                  "Mahasiswa",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined,
                color: AppColors.black),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // --- CARD INFORMASI ---
            const ProfileCard(),

            const SizedBox(height: 30),

            // --- GRID MENU ---
            const Text(
              "Menu Cepat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.85,
              children: const [
                CategoryItem(icon: Icons.menu_book_rounded, label: "KRS"),
                CategoryItem(icon: Icons.payments_outlined, label: "UKT"),
                CategoryItem(
                    icon: Icons.calendar_month_rounded, label: "Jadwal"),
                CategoryItem(icon: Icons.grade_rounded, label: "Nilai"),
              ],
            ),

            const SizedBox(height: 20),

            // --- LIST AKTIVITAS ---
            const Text(
              "Aktivitas Terakhir",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 0, bottom: 20),
                children: const [
                  ActivityItem(
                    title: "Pembayaran UKT",
                    subtitle: "Berhasil diverifikasi",
                    time: "2m lalu",
                    isHighPriority: true,
                  ),
                  ActivityItem(
                    title: "Revisi KRS",
                    subtitle: "Menunggu persetujuan Dosen",
                    time: "1j lalu",
                    isHighPriority: false,
                  ),
                  ActivityItem(
                    title: "Absensi Matkul Mobile",
                    subtitle: "Hadir di Gedung G3",
                    time: "08:00",
                    isHighPriority: false,
                  ),
                  ActivityItem(
                    title: "Tugas Praktikum",
                    subtitle: "Deadline besok malam",
                    time: "Kemarin",
                    isHighPriority: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}