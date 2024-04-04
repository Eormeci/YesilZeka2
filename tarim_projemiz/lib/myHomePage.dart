import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'build_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chatbot.dart';
import 'collection_screen.dart';
import 'colors.dart';
import 'colors.dart';
import 'learn_screen.dart';
import 'login_screen.dart';
import 'haber1.dart';
import 'haber2.dart';
import 'haber3.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> events = [
    {
      'image': 'images/haber1.jpeg',
      'distance': 'Tarımın 2023 karnesi',
      'name':
      "'Tarım sektörü, 2023 yılında üretim artışların ve düşüşlerin yaşandığı bir yıl olarak kayıtlara geçti.En çok üretilen 20 tarım ürününden 15’i çiftçiyi kısmen memnun ederken, 5'i ise kaybettirdi. ",
    },
    {
      'image': 'images/haber2.jpg',
      'distance': 'İklim değişikliği zeytin üretimini vurdu',
      'name':
      'İklim değişikliğiyle birlikte artan ortalama sıcaklıklar ve yetersiz yağışlar, diğer Akdeniz ülkelerinde olduğu gibi, Türkiye’de de zeytin üretimini olumsuz etkiledi.',
    },
    {
      'image': 'images/haber3.jpg',
      'distance':
      'KOP bölgesi modern tarımla iklim değişikliğine hazırlanıyor',
      'name':
      'Konya Ovası Projesi (KOP) Bölge Kalkınma İdaresi Başkanı Dr. Murat Karakoyunlu, "Bölgemiz için suyun bir damlası bile önemlidir" dedi.',
    },
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: firstColor, // Add your desired background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "YesilZeka",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatBot(
                              onBackButtonPressed: () {

                              }),
                        ),
                      );
                    },
                    child: FaIcon(
                      FontAwesomeIcons.robot,
                      color: Colors.yellow,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.facebook.com');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 30,
                    ),  
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.facebook.com');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: Colors.pinkAccent,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.facebook.com');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.youtube,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: secondColor, // Add your desired background color
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildButton(FontAwesomeIcons.sun, "Sunny", () {
                    }),
                    buildButton(FontAwesomeIcons.droplet, "Rainy", () {
                    }),
                    buildButton(FontAwesomeIcons.cloud, "Cloudy", () {
                    }),
                    buildButton(FontAwesomeIcons.rainbow, "Cloudy", () {
                    }),
                  ]
                  ,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                color: thirdColor, // Add your desired background color
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyNewPage1(
                                    onBackButtonPressed: () {
                                      // Your callback logic here
                                    }),
                              ),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyNewPage2(
                                    onBackButtonPressed: () {
                                      // Your callback logic here
                                    }),
                              ),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyNewPage3(
                                    onBackButtonPressed: () {
                                      // Your callback logic here
                                    }),
                              ),
                            );
                            break;
                        }
                      },
                      child: Container(
                        width: 350,
                        height: 180,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      events[index]['image'],
                                      height: 70,
                                      width: 320,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 4, left: 15),
                                  child: Text(
                                    events[index]['distance'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: 4, left: 15),
                                  child: Text(
                                    events[index]['name'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: fourthColor,
            color: Colors.white,
            items: [
              TabItem(icon: Icons.person, title: 'Profile'),
              TabItem(icon: Icons.photo, title: 'Collection'),
              TabItem(icon: Icons.school, title: 'Learn'),
              TabItem(icon: Icons.message, title: 'Forum'),
              TabItem(icon: Icons.book, title: 'Guide'),
              TabItem(icon: Icons.calendar_month, title: 'Calendar'),
            ],
            onTap: (int index) {
              switch (index) {
                case 0:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionScreen() ));
                  break;
                case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LearnScreen()));
                  break;
                case 3:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  break;
                case 4:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  break;
                case 5:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  break;
              }
            },
          )


      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  await launchUrl(Uri.parse(url));
}
