import 'package:flutter/material.dart';
import 'package:local_events/colors.dart';
import 'package:local_events/kayit_ol.dart';
import 'package:local_events/sifrenimi_unuttun.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        title: Text("Giriş Yap"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "E-posta",
                prefixIcon: Icon(Icons.mail), // Mail ikonu
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Şifre",
                prefixIcon: Icon(Icons.lock), // Kilit ikonu
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Butona tıklandığında yapılacak işlemler
                // Örneğin, kullanıcı adı ve şifre kontrolü yapabilirsiniz.
                print("Kullanıcı Adı: ${_usernameController.text}");
                print("Şifre: ${_passwordController.text}");
              },
              style: ElevatedButton.styleFrom(
                primary: bg, // Giriş Yap butonunun rengini bg olarak ayarla
              ),
              child: Text("Giriş Yap"),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SifrenimiUnuttun()));
                print("Şifreni mi unuttun?");
              },
              child: Text("Şifreni mi unuttun?", style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                // Kayıt ol işlemleri
                Navigator.push(context, MaterialPageRoute(builder: (context) => KayitOl()));
                print("Kayıt Ol");
              },
              child: Text("Kayıt Ol", style: TextStyle(color: Colors.blue)),
            ),
          ],

        ),
      ),
    );
  }
}
