import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nftmarketplace/screens/profile/createNft/createNFTstate.dart';
import 'package:riverpod/riverpod.dart';

class Createnftvm extends StateNotifier<Createnftstate> {
  Createnftvm() : super(Createnftstate());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      state = state.copyWith(imageFile: File(pickedFile.path));
    }
    log(pickedFile!.name);
  }
}

final createNftProvider = StateNotifierProvider<Createnftvm, Createnftstate>(
  (ref) => Createnftvm(),
);
