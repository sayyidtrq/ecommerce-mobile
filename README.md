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


# TUGAS 9

## *Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

Model digunakan untuk merepresentasikan data yang diambil atau dikirim dari server dalam bentuk objek yang dapat diakses dan dimanipulasi dengan mudah. Dengan membuat model, kita dapat mengonversi data JSON menjadi objek Dart dan sebaliknya. Jika tidak membuat model terlebih dahulu, maka kita harus mengakses data JSON secara langsung, yang dapat menyebabkan kesalahan dalam mengakses data dan membuat kode menjadi tidak terstruktur. Struktur Data yang Konsisten: Model memastikan bahwa data yang diterima atau dikirim memiliki struktur yang konsisten. Ini membantu dalam menghindari kesalahan yang mungkin terjadi karena perbedaan format data.Validasi Data: Model dapat digunakan untuk memvalidasi data yang diterima atau dikirim. Ini memastikan bahwa data yang diproses sesuai dengan yang diharapkan dan mengurangi kemungkinan terjadinya kesalahan.

## *Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

Library http digunakan untuk melakukan permintaan HTTP ke server dan menerima responsenya. Library ini menyediakan kelas Client untuk membuat permintaan HTTP, seperti GET, POST, PUT, DELETE, dan PATCH. Dengan library http, kita dapat mengirim data ke server, menerima data dari server, dan mengelola responsenya. Library http juga menyediakan dukungan untuk mengatur header permintaan, mengirim data dalam format JSON, dan menangani responsenya.

## * Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest digunakan untuk menyimpan cookie yang diterima dari server dan mengirimnya kembali ke server saat melakukan permintaan HTTP. CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter agar cookie yang diterima dari server dapat digunakan di seluruh aplikasi. Dengan menggunakan CookieRequest, kita dapat menyimpan cookie yang diterima dari server dan mengirimnya kembali ke server saat melakukan permintaan HTTP. Ini memungkinkan kita untuk mengelola sesi pengguna, autentikasi, dan otorisasi di aplikasi Flutter.

## *Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter adalah sebagai berikut:
1. Input Data: Data diambil dari pengguna melalui elemen input, seperti TextFormField atau TextField.

```dart
TextField(
  controller: _controller,
  decoration: InputDecoration(labelText: 'Enter your name'),
),
```

2. Validasi Data: Data yang diambil dari pengguna divalidasi untuk memastikan bahwa data yang dimasukkan sesuai dengan yang diharapkan.

```dart
if (_controller.text.isNotEmpty) {
  // Data valid
} else {
  // Data tidak valid
}
```
3. Penyimpanan Data: Data yang divalidasi disimpan dalam variabel atau objek untuk digunakan dalam aplikasi.

```dart
String name = _controller.text;
```
4. Pengiriman Data: Data yang disimpan dikirim ke server menggunakan permintaan HTTP, seperti POST atau PUT.

```dart
http.post(Uri.parse('https://api.example.com/data'), body: {'name': name});
```

5. Menerima Data: Server menerima data yang dikirim dan memberikan respons berupa data JSON atau objek Dart.

```dart
{
  "message": "Data received successfully"
}
```
6. Konversi Data: Data JSON yang diterima dikonversi menjadi objek Dart menggunakan model.

```dart
class Message {
  final String message;

  Message({required this.message});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(message: json['message']);
  }
}
```
7. Menampilkan Data: Data yang dikonversi ditampilkan pada aplikasi Flutter menggunakan widget, seperti Text atau ListView.

```dart
Message message = Message.fromJson(jsonDecode(response.body));
Text(message.message);
```

## *Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

1.  Register

Register: Pengguna memasukkan data akun di Flutter, data dikirim ke Django untuk validasi dan penyimpanan.

```dart
final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

// Ketika tombol register ditekan
ElevatedButton(
  onPressed: () async {
    String username = _usernameController.text;
    String password1 = _passwordController.text;
    String password2 = _confirmPasswordController.text;

    final response = await request.postJson(
      "http://127.0.0.1:8000/auth/register/",
      jsonEncode({
        "username": username,
        "password1": password1,
        "password2": password2,
      }),
    );

    if (context.mounted) {
      if (response['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully registered!'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to register!'),
          ),
        );
      }
    }
  },
  child: const Text('Register'),
);
```

2. Login
Pengguna memasukkan username dan password pada halaman login di aplikasi Flutter.

```dart
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

// Ketika tombol login ditekan
ElevatedButton(
  onPressed: () async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    final response = await request.login(
      "http://127.0.0.1:8000/auth/login/",
      {
        'username': username,
        'password': password,
      },
    );

    if (request.loggedIn) {
      String message = response['message'];
      String uname = response['username'];
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text("$message Selamat datang, $uname.")),
          );
      }
    } else {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Gagal'),
            content: Text(response['message']),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }
    }
  },
  child: const Text('Login'),
);
```

3. Logout
Proses Logout pada Flutter
Pengguna menekan tombol logout di aplikasi Flutter.
  
```dart
ElevatedButton(
  onPressed: () async {
    final response = await request.logout("http://127.0.0.1:8000/auth/logout/");
    if (response['status'] == 'success') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  },
  child: const Text('Logout'),
);
```

## *Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.

1. Membuat form registrasi pada Flutter dengan input username, password, dan konfirmasi password.
  
```dart
  final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

// Ketika tombol register ditekan
ElevatedButton(
  onPressed: () async {
    String username = _usernameController.text;
    String password1 = _passwordController.text;
    String password2 = _confirmPasswordController.text;

    final response = await request.postJson(
      "http://127.0.0.1:8000/auth/register/",
      jsonEncode({
        "username": username,
        "password1": password1,
        "password2": password2,
      }),
    );

    if (context.mounted) {
      if (response['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully registered!'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to register!'),
          ),
        );
      }
    }
  },
  child: const Text('Register'),
);
```
2. Membuat permintaan HTTP POST ke server Django untuk registrasi akun.
  
```dart
Future<Map<String, dynamic>> postJson(String url, dynamic body) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
```

3. Menampilkan pesan sukses atau gagal registrasi pada Flutter.
  
```dart
if (response['status'] == 'success') {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Successfully registered!'),
    ),
  );
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
} else {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Failed to register!'),
    ),
  );
}
```

### Membuat halaman login pada proyek tugas Flutter.

```dart
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

// Ketika tombol login ditekan
ElevatedButton(
  onPressed: () async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    final response = await request.login(
      "http://127.0.0.1:8000/auth/login/",
      {
        'username': username,
        'password': password,
      },
    );

    if (request.loggedIn) {
      String message = response['message'];
      String uname = response['username'];
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text("$message Selamat datang, $uname.")),
          );
      }
    } else {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Gagal'),
            content: Text(response['message']),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }
    }
  },
  child: const Text('Login'),
);
```

### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

1. Membuat endpoint API untuk registrasi, login, dan logout pada Django.
  
```python
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt # type: ignore
import json
from django.contrib.auth import logout as auth_logout
from main.models import ItemEntry

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
    
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if user.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = user.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)

@csrf_exempt
def create_item_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        new_item = ItemEntry.objects.create(
            user=request.user,
            name=data['name'],
            price=data['price'],
            description=data['description'],
            rarity=data['rarity'],
            rating=data['rating'],
            kategories=data['kategories'],
            image_url=data['image_url']
        )

        new_item.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)


@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```

### Membuat model kustom sesuai dengan proyek aplikasi Django

menggunakan quicktype untuk mengubah json pada django menjadi model kustom

```json
{
    "model": "main.itementry",
    "pk": 1,
    "fields": {
        "user": 1,
        "name": "Item 1",
        "price": 100,
        "description": "Description 1",
        "rarity": 1,
        "rating": 5,
        "kategories": "Category 1",
        "time": "2022-01-01T00:00:00Z",
        "image_url": "https://example.com/image1.jpg"
    }
}

```dart
// To parse this JSON data, do
//
//     final itementry = itementryFromJson(jsonString);

import 'dart:convert';

Itementry itementryFromJson(String str) => Itementry.fromJson(json.decode(str));

String itementryToJson(Itementry data) => json.encode(data.toJson());

class Itementry {
    String model;
    String pk;
    Fields fields;

    Itementry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Itementry.fromJson(Map<String, dynamic> json) => Itementry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int rarity;
    int rating;
    String kategories;
    DateTime time;
    String imageUrl;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.rarity,
        required this.rating,
        required this.kategories,
        required this.time,
        required this.imageUrl,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        rarity: json["rarity"],
        rating: json["rating"],
        kategories: json["kategories"],
        time: DateTime.parse(json["time"]),
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "rarity": rarity,
        "rating": rating,
        "kategories": kategories,
        "time": time.toIso8601String(),
        "image_url": imageUrl,
    };
}
```

### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.

Menggunakan FutureBuilder untuk mengambil data dari server Django dan menampilkannya pada halaman Flutter. Lalu menampilkan data item dalam bentuk Card. 

```dart
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:temuhobi/models/item_entry.dart';
import 'package:temuhobi/widgets/left_drawer.dart';
import 'package:temuhobi/widgets/screens/item_detail_page.dart';

class ItemEntryPage extends StatefulWidget {
  const ItemEntryPage({Key? key}) : super(key: key);

  @override
  State<ItemEntryPage> createState() => _itemEntryPageState();
}

class _itemEntryPageState extends State<ItemEntryPage> {
  Future<List<Itementry>> fetchItem(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;
    List<Itementry> itemEntries = [];
    for (var d in data) {
      if (d != null) {
        itemEntries.add(Itementry.fromJson(d));
      }
    }
    return itemEntries;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TemuHobi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchItem(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data item pada TemuHobi.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Popular Products',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ItemDetailPage(item: item),
                              ),
                            );
                          },
                          child: ItemCard(item: item),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Itementry item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12.0),
              ),
              child: Image.network(
                item.fields.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.fields.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${item.fields.price}',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\${item.fields.description}',
              style: const TextStyle(
                fontSize: 14.0,
                color: Color.fromARGB(255, 77, 63, 63),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16.0),
                Text(
                  '\${item.fields.rating}',
                  style: const TextStyle(fontSize: 14.0),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

Saya membuat halaman detail untuk setiap item yang terdapat pada halaman dengan menampilkan informasi detail item, seperti nama, harga, deskripsi, dan lainnya. Halaman detail menampilkan informasi item yang dipilih oleh pengguna dan memungkinkan pengguna untuk melihat detail item tersebut. Halaman detail juga menampilkan tombol untuk menambah item ke keranjang belanja atau melakukan tindakan lainnya.

```dart
import 'package:flutter/material.dart';
import 'package:temuhobi/models/item_entry.dart';

class ItemDetailPage extends StatelessWidget {
  final Itementry item;

  const ItemDetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.fields.imageUrl),
            const SizedBox(height: 16.0),
            Text(
              item.fields.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              '\$${item.fields.price}',
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              item.fields.description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Rarity: ${item.fields.rarity}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Rating: ${item.fields.rating}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Categories: ${item.fields.kategories}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Time: ${item.fields.time}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```










</details>