# *Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.*
- StatelessWidget adalah widget yang tidak memiliki state yang dapat berubah setelah widget tersebut dibuat. Artinya, widget ini bersifat statis atau tidak dapat berubah selama aplikasi berjalan, kecuali jika direbuild atau dibangun ulang secara manual oleh program.
1. Tidak punya state yang bisa berubah.
2. Cocok untuk UI statis (tidak berubah).
3. Contoh: Teks, ikon statis.
4. Tidak bisa diperbarui tanpa rebuild seluruh widget. 
5. UI statis, tidak berubah.

- StatefulWidget adalah widget yang memiliki state yang dapat berubah selama siklus hidup widget tersebut. Artinya, widget ini dapat memperbarui atau mengubah tampilannya secara dinamis saat aplikasi berjalan berdasarkan interaksi pengguna atau perubahan data.
1. Punya state yang bisa berubah.
2. Cocok untuk UI dinamis (berubah seiring interaksi).
3. Contoh: Tombol yang berubah warna saat ditekan, counter.
4. Menggunakan setState untuk memperbarui tampilan.
5. UI dinamis, bisa berubah selama aplikasi berjalan.

## *Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.*
setState() digunakan untuk memperbarui UI saat ada perubahan data pada widget Stateful. Dengan memanggil setState(), Flutter akan membangun ulang (re-render) bagian UI yang terkait, sehingga tampilan sesuai dengan data terbaru.

Variabel yang Terpengaruh:
- Variabel dalam State : Semua variabel yang didefinisikan di kelas State dari widget, seperti int counter, bool, String, atau List yang digunakan di build().
Intinya, setState() membuat Flutter tahu bahwa ada data yang berubah dan perlu diperbarui di layar.

## *Jelaskan perbedaan antara const dengan final.*
const: Nilai tetap pada compile-time (wajib diketahui saat kompilasi).
- Digunakan untuk nilai tetap yang sudah diketahui sejak kompilasi (compile-time constant).
- Objek yang dideklarasikan dengan const adalah immutable (tidak dapat diubah) dan dibuat hanya sekali di memori.
- Biasanya digunakan untuk nilai yang benar-benar konstan seperti angka tetap, string tetap, atau objek yang bisa dipastikan nilainya tidak akan berubah.

final: Nilai tetap pada runtime, bisa ditentukan saat program berjalan.
- Digunakan untuk nilai yang hanya bisa ditetapkan satu kali dan tidak bisa diubah setelah ditetapkan.
- Nilainya bisa ditentukan saat runtime, bukan hanya saat kompilasi.
- Cocok untuk nilai yang bisa berubah-ubah namun hanya perlu diinisialisasi sekali.

## *Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.*
* ### Membuat sebuah program Flutter 
1. Membuat folder baru bernama shopkint_mobile
2. buka terminal dan tulis prompt seperti dibawah ini

flutter create temuhobi
cd temuhobi

3. Jalankan dengan flutter run

* ### Membuat tiga tombol sederhana dengan ikon dan teks
1. Buat file baru di folder lib bernama menu.dart lalu pindahkan isi dari main.dart baris ke 39-kebawah dan tambahkan import 'package:flutter/material.dart';`lalu tambahkan code `home: const MyHomePage(title: 'Flutter Demo Home Page'), di main.dart
2. Membuat class di menu.dart untuk card info yang berisi nama, NPM, kelas

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

3. Membuat class baru yaitu ItemHomePage yang berisi nama dan icon di file menu.dart

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
 
dan setelah itu tambahkan code dibawah ini untuk membuat list tombol yang ada di homepage nya dan button dengan warna yang berbeda

final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Product", Icons.shopping_cart, Color(0xFF795548)), // Medium-light brown
    ItemHomepage("Tambah Product", Icons.add, Color(0xFF8D6E63)), // Medium brown
    ItemHomepage("Logout", Icons.logout, Color(0xFF8B5E5E)), // Muted reddish-brown for Logout
  ];

* ###  Memunculkan Snackbar
1. di menu.dart tambahkan class dibawah ini

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Use the item's color for background
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

* ### Membuat tiga tombol sederhana dengan ikon dan teks

1. Buat file baru di folder lib bernama menu.dart lalu pindahkan isi dari main.dart baris ke 39-kebawah dan tambahkan import 'package:flutter/material.dart';`lalu tambahkan code `home: const MyHomePage(title: 'Flutter Demo Home Page'), di main.dart

2. 
```dart
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list,
        const Color.fromARGB(255, 42, 45, 26)),
    ItemHomepage(
        "Tambah Produk", Icons.add, const Color.fromARGB(255, 33, 57, 26)),
    ItemHomepage("Logout", Icons.logout, const Color.fromARGB(255, 39, 95, 48)),
  ];
```

3.  
```dart
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  ItemHomepage(this.name, this.icon, this.color);
}
```
```dart
class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          String message;
          if (item.name == "Lihat Daftar Produk") {
            message = "Kamu telah menekan tombol Lihat Daftar Produk";
          } else if (item.name == "Tambah Produk") {
            message = "Kamu telah menekan tombol Tambah Produk";
          } else {
            message = "Kamu telah menekan tombol Logout";
          }
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(message)));
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```


# TUGAS 8

## *Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?*

const digunakan untuk membuat nilai yang tetap (konstan) pada saat kompilasi. Dengan menggunakan const, Flutter akan membuat objek hanya sekali di memori dan menggunakannya kembali jika objek yang sama dibutuhkan. Keuntungan menggunakan const adalah mengurangi penggunaan memori dan meningkatkan performa aplikasi karena objek yang sama tidak perlu dibuat berulang kali.

## *Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Column dan Row adalah widget layout yang digunakan untuk menyusun widget secara vertikal (Column) atau horizontal (Row). Perbedaan utama antara Column dan Row adalah arah susunan widget yang dihasilkan.

```dart
Column(
  children: [
    Text("Widget 1"),
    Text("Widget 2"),
    Text("Widget 3"),
  ],
)
```

```dart
 Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InfoCard(title: 'NPM', content: npm),
        InfoCard(title: 'Name', content: name),
        InfoCard(title: 'Class', content: className),
      ],
    ),
```

## *Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Elemen input yang digunakan pada halaman form adalah TextFormField, TextField, dan ElevatedButton. TextFormField digunakan untuk membuat input field yang dapat menerima input teks dari pengguna. TextField digunakan untuk membuat input field yang dapat menerima input teks dari pengguna. ElevatedButton digunakan untuk membuat tombol yang dapat ditekan oleh pengguna.

## *Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Tema (theme) dalam aplikasi Flutter dapat diatur dengan menggunakan ThemeData. ThemeData digunakan untuk mengatur warna, font, dan gaya aplikasi secara konsisten. ThemeData dapat diatur di MaterialApp dengan properti theme. Saya mengimplementasikan tema pada aplikasi yang saya buat dengan mengatur warna primer, warna aksen, dan font aplikasi.

## *Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Navigasi dalam aplikasi dengan banyak halaman pada Flutter dapat ditangani dengan menggunakan Navigator. Navigator digunakan untuk mengelola tumpukan halaman (routes) dalam aplikasi Flutter. Navigator memiliki method untuk menampilkan halaman baru, menghapus halaman, dan kembali ke halaman sebelumnya. Navigasi dapat dilakukan dengan menggunakan Navigator.push() untuk menampilkan halaman baru dan Navigator.pop() untuk kembali ke halaman sebelumnya.



</details>