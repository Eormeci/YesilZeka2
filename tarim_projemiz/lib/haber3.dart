import 'package:flutter/material.dart';

import 'colors.dart';

class MyNewPage3 extends StatelessWidget {
  final Function onBackButtonPressed;

  MyNewPage3({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geri Dön ..'),
        backgroundColor: bg,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fotoğraf
          Container(
            width: double.infinity,
            height: 200, // Fotoğraf yüksekliğini istediğin gibi ayarla
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/haber3.jpg'), // Fotoğrafın dosya yolunu güncelle
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Haber
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Bu bir haber başlığıdır. Haber içeriği buraya yazılacak.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Haber detayları burada yer alacak. İstediğin kadar uzun bir metin ekleyebilirsin.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
