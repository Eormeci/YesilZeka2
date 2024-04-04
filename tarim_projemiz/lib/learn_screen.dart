import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:local_events/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'colors.dart';

class LearnScreen extends StatefulWidget {
  LearnScreen({Key? key}) : super(key: key);
  @override
  _LearnScreen createState() => _LearnScreen();
}

class _LearnScreen extends State<LearnScreen> {
  late ImagePicker imagePicker;
  File? _image;
  String result = '';
  var image;
  late List<DetectedObject> objects;
  dynamic objectDetector;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    createObjectDetector();
  }

  @override
  void dispose() {
    super.dispose();
    objectDetector.close();
  }

  _imgFromCamera() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if(pickedFile != null) {
      _image = File(pickedFile.path);
      doObjectDetection();
    }
  }

  _imgFromGallery() async {
    XFile? pickedFile =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      doObjectDetection();
    }
  }

  Future<String> getModelPath(String asset) async {
    final path = '${(await getApplicationSupportDirectory()).path}/$asset';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  createObjectDetector() async {
    final modelPath = await getModelPath('machine_learning/mobilenet.tflite');
    final options = LocalObjectDetectorOptions(
      mode: DetectionMode.single,
      modelPath: modelPath,
      classifyObjects: true,
      multipleObjects: true,
    );
    objectDetector = ObjectDetector(options: options);
  }

  doObjectDetection() async {
    result = "";
    final inputImage = InputImage.fromFile(_image!);
    objects = await objectDetector.processImage(inputImage);

    for (DetectedObject object in objects) {
      List<Label> labels = object.labels;
      for (Label label in labels) {
        result += "${label.text}  ${label.confidence.toStringAsFixed(2)}%\n"; // Yüzde değerini ekle
      }
    }

    drawRectanglesAroundObjects();
  }


  drawRectanglesAroundObjects() async {
    image = await _image?.readAsBytes();
    image = await decodeImageFromList(image);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bg,
          title: Text("Makine öğrenmesi"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'),
                fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                width: 50,
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: ElevatedButton(
                        onPressed: _imgFromGallery,
                        onLongPress: _imgFromCamera,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent
                        ),
                        child: Container(
                          width: 250,
                          height: 250,
                          margin: const EdgeInsets.only(
                            top: 25,
                          ),
                          child: image != null
                              ? Center(
                            child: FittedBox(
                              child: SizedBox(
                                width: image.width.toDouble(),
                                height: image.width.toDouble(),
                                child: CustomPaint(
                                  painter: ObjectPainter(
                                    objectList: objects,
                                    imageFile: image,
                                    result: result, // Yeni argüman ekle
                                  ),
                                ),
                              ),
                            ),
                          )
                              : Container(
                            color: Colors.blue,
                            width: 250,
                            height: 250,
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 53,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12), // Kenar boşlukları ekleyin
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Arka plan rengi
                  borderRadius: BorderRadius.circular(20), // Köşeleri yuvarla
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Sadece gerektiği kadar yer kaplaması için
                  children: [
                    Icon(Icons.label, color: Colors.blue, size: 20), // Etiket simgesi
                    const SizedBox(width: 5), // Araya boşluk ekleyin
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'finger_paint',
                            fontSize: 16, // Metin boyutunu küçültün
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Predicted Label: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, // Kalın metin stili
                              ),
                            ),
                            TextSpan(
                              text: result,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Buton ile araya biraz boşluk ekleyin
              ElevatedButton.icon(
                onPressed: () {
                  // Yeni sayfaya geçiş yap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Camera()),
                  );
                },
                icon: Icon(Icons.camera), // Kamera ikonu
                label: Text("Kamerayı Aç"), // Buton metni
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class ObjectPainter extends CustomPainter {
  List<DetectedObject> objectList;
  dynamic imageFile;
  String result; // Yeni değişken tanımı
  ObjectPainter({required this.objectList, @required this.imageFile, required this.result}); // Argümanı zorunlu hale getir

  @override
  void paint(Canvas canvas, Size size) {
    if (imageFile != null) {
      canvas.drawImage(imageFile, Offset.zero, Paint());
    }
    Paint p = Paint();
    p.color = Colors.red;
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 4;

    for (DetectedObject rectangle in objectList) {
      canvas.drawRect(rectangle.boundingBox, p);
      var list = rectangle.labels;
      for (Label label in list) {
        //print("${label.text}   ${label.confidence.toStringAsFixed(2)}");
        //Image'ın içindeki
        TextSpan span = TextSpan();
        TextPainter tp = TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
        tp.layout();
        tp.paint(canvas, Offset(rectangle.boundingBox.left, rectangle.boundingBox.top));

        break;
      }
    }
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
