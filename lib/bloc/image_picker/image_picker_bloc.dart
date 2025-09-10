import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/image_picker_utils.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils _imagePickerUtils;

  ImagePickerBloc(this._imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryImagePicker>(_pickImageFromGallery);
  }

  Future<void> _cameraCapture(
      CameraCapture event,
      Emitter<ImagePickerState> emit,
      ) async {
    final XFile? file = await _imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  Future<void> _pickImageFromGallery(
      GalleryImagePicker event,
      Emitter<ImagePickerState> emit,
      ) async {
    final XFile? file = await _imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
