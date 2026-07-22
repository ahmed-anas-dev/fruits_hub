import 'dart:convert';

import 'package:fruits_hub/core/services/shared_preferences_singelton.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

UserEntity? GetUser() {

  var jsonString = Prefs.getString("user");
  if (jsonString == null||jsonString.isEmpty) return null;

  var userEntity = UserModel.fromjson(jsonDecode(jsonString));
  return userEntity;
}
