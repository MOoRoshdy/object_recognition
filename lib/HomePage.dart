import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_recognition/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isWorking = false;
  String result = "";
  CameraController cameraController;
  CameraImage imgCamera;

  initCamera() {
    cameraController = cameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((imageFromStream) => {
          if(!isWorking){
            isWorking=true,
            imgCamera=imageFromStream,
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        body: Container(
          
        ),)),
    );
  }
}
