import 'dart:io';

class Createnftstate {
  File? imageFile;
  Createnftstate({this.imageFile});
  Createnftstate copyWith({File? imageFile}) {
    return Createnftstate(imageFile: imageFile ?? this.imageFile);
  }
}
