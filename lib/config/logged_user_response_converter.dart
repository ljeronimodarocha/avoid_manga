import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class LoggedUserResponseConverter
    implements JsonConverter<User, Map<String, dynamic>> {
  const LoggedUserResponseConverter();

  @override
  User fromJson(Map<String, dynamic> json) {
    if (json['runtimeType'] != null) {
      return LoggedUser.fromJson(json);
    }
    if (json.containsKey("access_token")) {
      return LoggedUser.fromJson(json);
    }
    if (json.containsKey("grantType")) {
      return User.fromJson(json);
    }
    return const NotLoggedUser();
  }

  @override
  Map<String, dynamic> toJson(User data) => data.toJson();
}
