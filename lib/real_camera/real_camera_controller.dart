import 'dart:io';

import 'package:bereal/real_camera/real_camera_state.dart';
import 'package:camera/camera.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'real_camera_controller.g.dart';

@riverpod
class RealCameraController extends _$RealCameraController {
  late CameraController _controller;

  @override
  RealCameraState build() {
    return const RealCameraState.initial();
  }

  void init() async {
    final cameras = await availableCameras();
    _controller = CameraController(
        cameras.firstWhere((description) => description.lensDirection == CameraLensDirection.back),
        ResolutionPreset.high);
    await _controller.initialize();
    _controller.setZoomLevel(await _controller.getMinZoomLevel());
    state = RealCameraState.started(cameraController: _controller);
  }

  void takePhoto() async {
    final image = await _controller.takePicture();
    state = RealCameraState.captured(image: image);

    final cameras = await availableCameras();
    _controller = CameraController(
        cameras.firstWhere((description) => description.lensDirection == CameraLensDirection.front),
        ResolutionPreset.high);
    await _controller.initialize();
    _controller.setZoomLevel(await _controller.getMinZoomLevel());
    _controller.setFlashMode(FlashMode.off);
    sleep(const Duration(milliseconds: 500));
    final selfie = await _controller.takePicture();

    state = RealCameraState.finalized(photo: image, selfie: selfie);
  }

  void dispose() {
    _controller.stopImageStream();
    _controller.dispose();
  }
}
