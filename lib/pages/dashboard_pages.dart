import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/category_item.dart';
import '../widgets/activity_item.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void _handleCategoryTap(BuildContext context, String menuName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Menu $menuName ditekan'),
        duration: const Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleActivityTap(BuildContext context, String activityTitle) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Detail: $activityTitle'),
        duration: const Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 360 ? 3 : 4;
    
    return Scaffold(
      backgroundColor: AppColors.babyPowder,
      
      appBar: AppBar(
        backgroundColor: AppColors.babyPowder,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tidak ada notifikasi baru'),
                  duration: Duration(milliseconds: 800),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined, color: AppColors.black),
                // Dot notifikasi (optional)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.coquelicot,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.orangeWheel, AppColors.coquelicot],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.orangeWheel.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Avatar
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColors.coquelicot,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Yurida Zani",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Informatika • Semester 7",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Aktif",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Menu Cepat",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.95,
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
                      if (crossAxisCount == 4) ...[
                        CategoryItem(
                          icon: Icons.library_books_rounded,
                          label: "Perpus",
                          onTap: () => _handleCategoryTap(context, "Perpus"),
                        ),
                        CategoryItem(
                          icon: Icons.school_rounded,
                          label: "Akademik",
                          onTap: () => _handleCategoryTap(context, "Akademik"),
                        ),
                        CategoryItem(
                          icon: Icons.message_rounded,
                          label: "Pesan",
                          onTap: () => _handleCategoryTap(context, "Pesan"),
                        ),
                        CategoryItem(
                          icon: Icons.more_horiz_rounded,
                          label: "Lainnya",
                          onTap: () => _handleCategoryTap(context, "Lainnya"),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Informasi Penting",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildInfoCard(
                          icon: Icons.payment,
                          title: "UKT Semester 5",
                          value: "Lunas",
                          color: Colors.green,
                        ),
                        _buildInfoCard(
                          icon: Icons.stars,
                          title: "IPK",
                          value: "3.75",
                          color: AppColors.orangeWheel,
                        ),
                        _buildInfoCard(
                          icon: Icons.check_circle,
                          title: "SKS Tempuh",
                          value: "88 / 144",
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Aktivitas Terakhir",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Lihat Semua",
                          style: TextStyle(
                            color: AppColors.orangeWheel,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                        onTap: () => _handleActivityTap(
                            context, activity['title'] as String),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.khaki.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}