import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class GalleryPage1 extends StatefulWidget {
  const GalleryPage1({super.key});

  @override
  State<GalleryPage1> createState() => _GalleryPage1State();
}

class _GalleryPage1State extends State<GalleryPage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        title: Text("Giriş Yap"),
      ),
    ));
  }
}
