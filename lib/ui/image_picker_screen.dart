import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/image_picker/image_picker_bloc.dart';
import '../utils/image_picker_utils.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Picker with BLoC")),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return Center(
            child: state.file == null
                ? const Text("No image selected")
                : Image.file(
              File(state.file!.path),
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Pick image by Camera",
            onPressed: () {
              context.read<ImagePickerBloc>().add(CameraCapture());
            },
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: "Pick image by Gallery",
            onPressed: () {
              context.read<ImagePickerBloc>().add(GalleryImagePicker());
            },
            child: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}