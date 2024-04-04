import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class DiscoverPage3 extends StatefulWidget {
  const DiscoverPage3({super.key});

  @override
  State<DiscoverPage3> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage3> {
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
