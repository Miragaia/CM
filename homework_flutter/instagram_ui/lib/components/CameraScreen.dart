import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;
  String? _capturedImagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras(); // Get the list of available cameras

      if (cameras!.isNotEmpty) {
        _controller = CameraController(
          cameras![0], // Use the back camera
          ResolutionPreset.high,
        );

        await _controller!.initialize(); // Initialize the controller
        setState(() {
          _isCameraInitialized = true;
        });
      } else {
        print('No cameras found'); // Handle the case where no cameras are found
      }
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    if (!_controller!.value.isInitialized) {
      print('Camera not initialized');
      return;
    }

    try {
      final image = await _controller!.takePicture();
      print('Picture taken: ${image.path}');
      setState(() {
        _capturedImagePath = image.path; // Save the captured image path
      });
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          if (_isCameraInitialized && _controller != null)
            _capturedImagePath == null
                ? CameraPreview(_controller!) // Show camera feed if no image is captured
                : Image.file(File(_capturedImagePath!)) // Show the captured image
          else
            Center(child: CircularProgressIndicator()), // Show a loading indicator while initializing
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: _capturedImagePath == null
                    ? _takePhoto
                    : () {
                        setState(() {
                          _capturedImagePath = null; // Retake the photo, reset preview
                        });
                      },
                backgroundColor: Colors.white,
                child: Icon(
                  _capturedImagePath == null ? Icons.circle : Icons.camera_alt,
                  color: Colors.black,
                  size: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}