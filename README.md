# Evaluasi UX Desain - Dashboard Mahasiswa

**Identitas Mahasiswa:**
* **Nama:** Yurida Zani
* **NIM:** 221080200001
* **Mata Kuliah:** Pemrograman Mobile 7A2

---

### 1. Nilai User Experience (UX) Terbaik
Nilai UX terbaik dari desain ini adalah **Hierarki Visual dan Efisiensi Navigasi**. 
* Menu kategori ("Menu Cepat") diletakkan di bagian atas dengan layout Grid 3 kolom yang lega, memudahkan pengguna untuk langsung mengakses fitur utama tanpa perlu melakukan *scrolling*.
* Pemisahan blok informasi (Grid Menu, Card Profil, List Aktivitas) sangat jelas berkat penggunaan *white space* yang cukup.

### 2. Bagian yang Masih Bisa Ditingkatkan
Bagian yang bisa ditingkatkan adalah **Readability (Keterbacaan) Teks Sekunder**.
* Warna teks *subtitle* (seperti "Informatika - Sem. 5" atau waktu "2m lalu") saat ini menggunakan warna putih transparan atau abu-abu muda. Kontrasnya bisa ditingkatkan sedikit lagi agar lebih mudah dibaca di kondisi cahaya terang atau oleh pengguna dengan gangguan penglihatan.

### 3. Prinsip Material Design yang Diterapkan
Desain ini menerapkan prinsip-prinsip berikut:
* **Surfaces & Depth (Permukaan & Kedalaman):** Menggunakan widget `Card` dengan properti `elevation` dan `shadowColor` untuk memberikan efek melayang dan membedakan elemen dari *background*.
* **Feedback (Umpan Balik):** Menggunakan `InkWell` pada setiap item (Menu dan List) untuk memberikan efek gelombang (*ripple effect*) saat disentuh, memberi konfirmasi visual kepada pengguna.
* **Containment (Wadah):** Menggunakan `GridView` dan `ListTile` untuk mengelompokkan konten yang sejenis dalam wadah yang terstruktur dan konsisten.
