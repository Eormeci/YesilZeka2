import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class GalleryPage3 extends StatefulWidget {
  const GalleryPage3({super.key});

  @override
  State<GalleryPage3> createState() => _GalleryPage3State();
}

class _GalleryPage3State extends State<GalleryPage3> {
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
