import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class GalleryPage2 extends StatefulWidget {
  const GalleryPage2({super.key});

  @override
  State<GalleryPage2> createState() => _GalleryPage2State();
}

class _GalleryPage2State extends State<GalleryPage2> {
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
