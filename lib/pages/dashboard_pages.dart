import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/profile_card.dart';
import '../widgets/category_item.dart';
import '../widgets/activity_item.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void _handleCategoryTap(BuildContext context, String menuName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Menu $menuName ditekan'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleActivityTap(BuildContext context, String activityTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Detail: $activityTitle'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

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
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tidak ada notifikasi baru'),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: const Icon(Icons.notifications_outlined,
                color: AppColors.black),
          )
        ],
      ),
      // FIX: Wrap body dengan SingleChildScrollView
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // --- BAGIAN 1: GRIDVIEW KATEGORI (Atas) ---
              const Text(
                "Menu Kategori",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 15),
              
              GridView.count(
                shrinkWrap: true, // PENTING: Harus true di dalam scroll view
                physics: const NeverScrollableScrollPhysics(), // Disable scroll GridView
                crossAxisCount: 3,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1.0,
                children: [
                  CategoryItem(
                    icon: Icons.menu_book_rounded, 
                    label: "KRS",
                    onTap: () => _handleCategoryTap(context, "KRS"),
                  ),
                  CategoryItem(
                    icon: Icons.payments_outlined, 
                    label: "UKT",
                    onTap: () => _handleCategoryTap(context, "UKT"),
                  ),
                  CategoryItem(
                    icon: Icons.calendar_month_rounded, 
                    label: "Jadwal",
                    onTap: () => _handleCategoryTap(context, "Jadwal"),
                  ),
                  CategoryItem(
                    icon: Icons.grade_rounded, 
                    label: "Nilai",
                    onTap: () => _handleCategoryTap(context, "Nilai"),
                  ),
                  CategoryItem(
                    icon: Icons.library_books_rounded, 
                    label: "Perpus",
                    onTap: () => _handleCategoryTap(context, "Perpus"),
                  ),
                  CategoryItem(
                    icon: Icons.more_horiz_rounded, 
                    label: "Lainnya",
                    onTap: () => _handleCategoryTap(context, "Lainnya"),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              
              // --- BAGIAN 2: CARD INFORMASI (Tengah) ---
              const Text(
                "Informasi Singkat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              const ProfileCard(),

              const SizedBox(height: 25),

              // --- BAGIAN 3: LISTTILE AKTIVITAS (Bawah) ---
              const Text(
                "Aktivitas Terakhir",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 10),
              
              // FIX: Ganti Expanded dengan Column biasa
              // Karena parent sudah scrollable
              ListView.builder(
                shrinkWrap: true, // PENTING untuk nested scroll
                physics: const NeverScrollableScrollPhysics(), // Disable inner scroll
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final activities = [
                    {
                      'title': 'Pembayaran UKT',
                      'subtitle': 'Berhasil diverifikasi',
                      'time': '2m lalu',
                      'priority': true,
                    },
                    {
                      'title': 'Revisi KRS',
                      'subtitle': 'Menunggu persetujuan Dosen',
                      'time': '1j lalu',
                      'priority': false,
                    },
                    {
                      'title': 'Absensi Matkul Mobile',
                      'subtitle': 'Hadir di Gedung G3',
                      'time': '08:00',
                      'priority': false,
                    },
                    {
                      'title': 'Tugas Praktikum',
                      'subtitle': 'Deadline besok malam',
                      'time': 'Kemarin',
                      'priority': true,
                    },
                  ];
                  
                  final activity = activities[index];
                  return ActivityItem(
                    title: activity['title'] as String,
                    subtitle: activity['subtitle'] as String,
                    time: activity['time'] as String,
                    isHighPriority: activity['priority'] as bool,
                    onTap: () => _handleActivityTap(context, activity['title'] as String),
                  );
                },
              ),
              
              const SizedBox(height: 20), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}