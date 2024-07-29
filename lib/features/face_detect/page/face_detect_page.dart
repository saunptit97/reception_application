import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:reception_application/common/index.dart';
import 'package:reception_application/di/di_setup.dart';
import 'package:reception_application/features/face_detect/page/widget/image_detect_rectangle.dart';
import 'package:smart_robot/smart_robot.dart';
import '../../../gen/assets.gen.dart';
import '../domain/face_detect_offset.dart';

@RoutePage()
class FaceDetectPage extends StatefulWidget {
  const FaceDetectPage({super.key, required this.onFaceDetect});
  final Function(bool)? onFaceDetect;

  @override
  State<FaceDetectPage> createState() => _FaceDetectPageState();
}

class _FaceDetectPageState extends State<FaceDetectPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  CameraController? _cameraController;
  final _faceDetectPlugin = getIt<SmartRobot>();
  Widget? imageWidget;
  Timer? timer;
  List<FaceDetectOffset> faces = [];

  Future<void> initCamera() async {
    final CameraDescription camera = await _getCamera();
    _cameraController = CameraController(
      camera,
      ResolutionPreset.medium,
    );
    await _cameraController?.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        _takePicturePeriodically();
      }
      setState(() {});
    });
    await _cameraController
        ?.lockCaptureOrientation(DeviceOrientation.portraitUp);
  }

  void _deletePicture(XFile picture) {
    final File file = File(picture.path);
    if (file.existsSync()) {
      file.deleteSync();
      print('Picture deleted: ${picture.path}');
    }
  }

  Future<void> _takePicturePeriodically() async {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_cameraController?.value.isInitialized ?? false) {
        final XFile? picture = await _cameraController?.takePicture();
        print('Picture taken: ${picture?.path}');
        String? result =
            await _faceDetectPlugin.detectFace(picture?.path ?? '');
        final points = jsonDecode(result ?? "[]");
        setState(() {
          faces = points
              .map<FaceDetectOffset>((e) => FaceDetectOffset.fromJson(e))
              .toList();
        });
        for (var element in faces) {
          print(
              "Bouding box: ${element.w - element.x} x ${element.h - element.y}");
        }
        if (faces.isNotEmpty) {
          Future.delayed(const Duration(seconds: 5)).then((value) {
            widget.onFaceDetect?.call(false);
          });
        }
        if (picture != null) {
          _deletePicture(picture);
        }
      }
    });
  }

  Future<CameraDescription> _getCamera() async {
    final cameras = await availableCameras();
    return cameras.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first);
  }

  @override
  void initState() {
    super.initState();
    initModel();
    initCamera();
  }

  Future<void> initModel() async {
    try {
      await _faceDetectPlugin.initFaceDetectModel();
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   final CameraController? cameraController = _cameraController;
  //
  //   // App state changed before we got the chance to initialize.
  //   if (cameraController == null || !cameraController.value.isInitialized) {
  //     return;
  //   }
  //
  //
  //   if (state == AppLifecycleState.inactive) {
  //     cameraController.dispose();
  //   } else if (state == AppLifecycleState.resumed) {
  //     initCamera();
  //   }
  // }

  @override
  void dispose() {
    timer?.cancel();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: BaseAppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          onPressedLeading: widget.onFaceDetect != null
              ? () {
                  widget.onFaceDetect?.call(false);
                }
              : null,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      final ImagePicker imagePicker = ImagePicker();
                      XFile? image = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (image != null) {
                        setState(() {
                          imageWidget = Image.file(File(image.path));
                        });
                        String? result =
                            await _faceDetectPlugin.detectFace(image.path);
                        final points = jsonDecode(result ?? "[]");
                        // List<FaceDetectOffset> faces = points.map<FaceDetectOffset>((e) => FaceDetectOffset.fromJson(e)).toList();
                        // setState(() {
                        //   imageWidget = ImageRectangleDrawer(imagePath: image.path, points: faces);
                        // });

                        print('Result: $points');
                      } else {
                        print('No image selected.');
                      }
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
                child: (_cameraController?.value.isInitialized ?? false)
                    ? Stack(
                        children: [
                          SizedBox(
                              width: 640,
                              height: 480,
                              child: CameraPreview(_cameraController!)),
                          SizedBox(
                            width: 640,
                            height: 480,
                            child: CustomPaint(
                              painter: RectanglePainter(
                                points: faces,
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(
                        color: Colors.black,
                      ),
              ),
            ],
          ),
        ));
  }
}
