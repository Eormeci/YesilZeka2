import 'package:flutter/material.dart';

class SifrenimiUnuttun extends StatelessWidget {
  const SifrenimiUnuttun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifreni Mi Unuttun?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'E-posta adresinizi girerek şifrenizi sıfırlayabilirsiniz.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-posta',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Şifre sıfırlama işlemleri burada yapılabilir
                // Örneğin: _sifreSifirla(_emailController.text);
              },
              child: Text('Şifremi Sıfırla'),
            ),
          ],
        ),
      ),
    );
  }
}
