import 'package:flutter/material.dart';

class KayitOl extends StatefulWidget {
  const KayitOl({super.key});

  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  TextEditingController _adController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kayıt Ol'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _adController,
                decoration: InputDecoration(
                  labelText: 'Adınız',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-posta',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _sifreController,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                ),
                obscureText: true,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Kayıt olma işlemleri burada yapılabilir
                  // Örneğin: _kayitOl(_adController.text, _emailController.text, _sifreController.text);
                },
                child: Text('Kayıt Ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
