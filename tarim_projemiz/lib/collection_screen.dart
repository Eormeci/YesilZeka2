import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_events/discover_page1.dart';
import 'package:local_events/gallery_page1.dart';
import 'colors.dart';
import 'discover_page2.dart';
import 'discover_page3.dart';
import 'gallery_page2.dart';
import 'gallery_page3.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  // Function to generate a container with image and text
  Widget buildContainer(String imagePath, String mainText, String subText, Widget discoverPage,Widget galleryPage) {
    return Center(
      child: Container(
        width: 310,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[300]!,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    imagePath,
                    width: 260,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    mainText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    subText,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(left: 35, right: 5, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => discoverPage));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.search, size: 20),
                              SizedBox(width: 8),
                              Text("Keşfet", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => galleryPage));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.image, size: 20),
                              SizedBox(width: 8),
                              Text("Galeri", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                        Spacer(),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
              SizedBox(height: 20),
              buildContainer(
                "images/lale.jpg",
                "Salon bitkileri",
                "Yeşil Bir Dokunuş, Evini Canlandır!",
                DiscoverPage1(),GalleryPage1()
              ),
              SizedBox(height: 20),
              buildContainer(
                "images/bocek.jpg",
                "Böcekler",
                "Doğanın Küçük Kahramanlarına Saygıyla!",
                DiscoverPage2(),GalleryPage2()
              ),
              SizedBox(height: 20),
              buildContainer(
                "images/mushroom.jpg",
                "Mantarlar",
                "Keşfet,öğren,yetiştir!",
                DiscoverPage3(),GalleryPage3()
              ),
              SizedBox(height: 20),
              buildContainer(
                "images/kaktus.jpg",
                "Kaktüsler",
                "Dayanıklı Güzellik: Kaktüslerle Doğayı Evine Taşı",
                DiscoverPage3(),GalleryPage3()
              ),
              SizedBox(height: 20),
              buildContainer(
                "images/gubre.jpg",
                "Mantarlar",
                "Keşfet,öğren,yetiştir!",
                DiscoverPage3(),GalleryPage3()
              )
            ],
          ),
        ),
      ),
    );
  }
}
