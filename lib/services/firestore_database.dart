import 'dart:async';

import 'package:firebase_user_avatar_flutter/models/avatar_reference.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_path.dart';
import 'package:firebase_user_avatar_flutter/services/firestore_service.dart';
import 'package:flutter/foundation.dart';

class FirestoreDatabase {
  final _service = FirestoreService.instance;

  Future<void> setAvatarReference({
    @required String uid,
    @required AvatarReference avatarReference,
  }) async =>
      await _service.setData(
        path: FirestorePath.avatar(uid),
        data: avatarReference.toMap(),
      );

  Stream<AvatarReference> avatarReferenceStream({
    @required String uid,
  }) =>
      _service.documentStream(
        path: FirestorePath.avatar(uid),
        builder: (data, _) => AvatarReference.fromMap(data),
      );
}
