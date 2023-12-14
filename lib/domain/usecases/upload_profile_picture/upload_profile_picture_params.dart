import 'dart:io';

import 'package:flix_id/domain/entities/user.dart';

class UploadProfilePictureParams {
  final User user;
  final File imageFile;

  UploadProfilePictureParams({required this.user, required this.imageFile});
}
