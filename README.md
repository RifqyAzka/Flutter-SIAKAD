Mobile Project
Proyek ini adalah aplikasi mobile yang menggunakan Flutter. Berikut adalah petunjuk untuk menjalankan proyek ini di lokal.

Persyaratan
Pastikan Anda telah menginstal Flutter dan memiliki akses ke CLI Flutter. Anda dapat memeriksa instalasi Flutter dengan perintah berikut:
flutter --version

Langkah-langkah untuk Menjalankan Proyek

1. Menjalankan Perintah Pub Get

Untuk mengunduh semua dependensi yang diperlukan oleh proyek ini, jalankan perintah berikut di direktori proyek Anda:
flutter pub get

2. Mengubah Variabel dalam File Dart

Ubah variabel yang diperlukan dalam file Dart sesuai dengan link dari ngrok yang Anda miliki. Misalnya, jika Anda menggunakan ngrok untuk membuat terowongan HTTP ke port 8000, Anda harus memperbarui URL API di file Dart dengan URL ngrok tersebut:
const String apiUrl = 'http://your-ngrok-url:8000';

3. Menjalankan Aplikasi dalam Mode Debug

Untuk menjalankan aplikasi dalam mode debug, gunakan perintah berikut:
flutter run
Atau, Anda dapat menggunakan IDE seperti VS Code atau Android Studio untuk menjalankan aplikasi dengan memilih opsi debug.

Penjelasan Variabel Ngrok
Ngrok adalah alat yang digunakan untuk menyiapkan terowongan dari lokal ke internet. Ini sangat berguna untuk menguji aplikasi mobile yang berinteraksi dengan server lokal. Pastikan Anda menjalankan ngrok dengan perintah:
ngrok http 8000

Catatan Tambahan
Pastikan Anda selalu memperbarui URL ngrok setiap kali Anda memulai ulang ngrok, karena URL yang dihasilkan oleh ngrok bersifat sementara.
Jika Anda menghadapi masalah saat menjalankan proyek, pastikan untuk memeriksa log dan error message untuk penjelasan lebih lanjut.
