import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:reception_application/common/index.dart';
import 'package:smart_robot/smart_robot.dart';
import '../../../gen/assets.gen.dart';
import 'package:adv_camera/adv_camera.dart';

import '../domain/face_detect_offset.dart';
import 'widget/image_detect_rectangle.dart';

@RoutePage()
class FaceDetectV2Page extends StatefulWidget {
  const FaceDetectV2Page({super.key});

  @override
  State<FaceDetectV2Page> createState() => _FaceDetectV2PageState();
}

class _FaceDetectV2PageState extends State<FaceDetectV2Page>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  final _faceDetectPlugin = SmartRobot();
  AdvCameraController? cameraController;
  Widget? imageWidget;
  Timer? timer;
  List<FaceDetectOffset> faces = [];

  void _deletePicture(String picture) {
    final File file = File(picture);
    if (file.existsSync()) {
      file.deleteSync();
      print('Picture deleted: $picture');
    }
  }

  Future<void> _takePicturePeriodically() async {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      cameraController?.captureImage();
    });
  }

  @override
  void initState() {
    super.initState();
    initModel();
    // initCamera();
  }

  _onCameraCreated(AdvCameraController controller) {
    cameraController = controller;
    cameraController?.setPictureSize(640, 480);
    _takePicturePeriodically();
  }

  Future<void> initModel() async {
    try {
      await _faceDetectPlugin.initFaceDetectModel();
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: const BaseAppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageWidget ??
                      InkWell(
                        onTap: () async {
                          cameraController?.captureImage();
                          // final ImagePicker imagePicker = ImagePicker();
                          // XFile? image = await imagePicker.pickImage(
                          //     source: ImageSource.gallery);
                          // if (image != null) {
                          //   setState(() {
                          //     imageWidget = Image.file(File(image.path));
                          //   });
                          //   String? result =
                          //       await _faceDetectPlugin.detectFace(image.path);
                          //   final points = jsonDecode(result ?? "[]");
                          //   // faces = points.map<FaceDetectOffset>((e) => FaceDetectOffset.fromJson(e)).toList();
                          //   // setState(() {
                          //   //   imageWidget = ImageRectangleDrawer(imagePath: image.path, points: faces);
                          //   // });
                          //
                          //   print('Result: $points');
                          // } else {
                          //   print('No image selected.');
                          // }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 1.sw / 3,
                          child: Lottie.asset(
                            Assets.lottie.robotWellcome.path,
                            repeat: true,
                            // reverse: true,
                            animate: true,
                            width: 1.sw / 4,
                          ),
                        ),
                      ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 640,
                      height: 480,
                      child: AdvCamera(
                        initialCameraType: CameraType.rear,
                        onCameraCreated: _onCameraCreated,
                        onImageCaptured: (String path) async {
                          // setState(() {
                          //   imageWidget = Image.file(File(path));
                          // });
                          String? result =
                              await _faceDetectPlugin.detectFace(path);
                          final points = jsonDecode(result ?? "[]");
                          setState(() {
                            faces = points
                                .map<FaceDetectOffset>(
                                    (e) => FaceDetectOffset.fromJson(e))
                                .toList();
                          });
                          faces.forEach((element) {
                            print(
                                "Bouding box: ${element.w - element.x} x ${element.h - element.y}");
                          });
                          print(points);
                          _deletePicture(path);
                        },
                        cameraPreviewRatio: CameraPreviewRatio.r4_3,
                        focusRectColor: Colors.purple,
                        focusRectSize: 200,
                      ),
                    ),
                    SizedBox(
                        width: 640,
                        height: 480,
                        child: CustomPaint(
                          painter: RectanglePainter(
                            points: faces,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
