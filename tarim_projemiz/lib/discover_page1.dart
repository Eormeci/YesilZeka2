import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class DiscoverPage1 extends StatefulWidget {
  const DiscoverPage1({super.key});

  @override
  State<DiscoverPage1> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage1> {
  // Açıklama metinleri ve diğer bilgiler metinlerini saklamak için bir liste tanımlayın
  final List<String> descriptions = [
    "Açıklama 1",
    "Açıklama 2",
    "Açıklama 3",
  ];

  final List<String> otherInfos = [
    "Diğer bilgiler 1",
    "Diğer bilgiler 2",
    "Diğer bilgiler 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        title: Text("Giriş Yap"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        // İmaj için
                        width: double.infinity,
                        height: 200, // Uygun boyutu belirleyin
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/salon${i + 1}.jpeg'), // İmaj dosyanızın yolunu belirtin
                            fit: BoxFit.cover, // İmajın boyutunu belirtin
                          ),
                          borderRadius: BorderRadius.circular(15.0), // İmajın kenarlık yuvarlaklığını belirleyin
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        descriptions[i], // İlgili indeksteki açıklama metnini kullanın
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        otherInfos[i], // İlgili indeksteki diğer bilgiler metnini kullanın
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
