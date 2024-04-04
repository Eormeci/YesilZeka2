import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class DiscoverPage2 extends StatefulWidget {
  const DiscoverPage2({super.key});

  @override
  State<DiscoverPage2> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: bg,
            title: Text("Giriş Yap"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [

                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
