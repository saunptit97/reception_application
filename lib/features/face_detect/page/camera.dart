import 'dart:io';

import 'package:adv_camera/adv_camera.dart';
import 'package:flutter/material.dart';

class CameraApp extends StatefulWidget {
  final String id;

  const CameraApp({Key? key, required this.id}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  List<String> pictureSizes = <String>[];
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdvCamera Example'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: AdvCamera(
                    initialCameraType: CameraType.rear,
                    onCameraCreated: _onCameraCreated,
                    onImageCaptured: (String path) {
                      if (this.mounted)
                        setState(() {
                          imagePath = path;
                        });
                    },
                    cameraPreviewRatio: CameraPreviewRatio.r16_9,
                    focusRectColor: Colors.purple,
                    focusRectSize: 200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AdvCameraController? cameraController;

  _onCameraCreated(AdvCameraController controller) {
    this.cameraController = controller;

    this.cameraController!.getPictureSizes().then((pictureSizes) {
      setState(() {
        this.pictureSizes = pictureSizes ?? <String>[];
      });
    });
  }
}