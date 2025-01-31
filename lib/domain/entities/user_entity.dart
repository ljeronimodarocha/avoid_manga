import 'package:avoid_manga/config/logged_user_response_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
sealed class User with _$User {
  const factory User(@LoggedUserResponseConverter() String grantType,
      String clientId, String clientSecre) = _User;

  const factory User.notLogged() = NotLoggedUser;

  const factory User.logged(
    @JsonKey(name: "access_token") String token,
    @JsonKey(
      name: "expires_in",
    )
    num expiresIn,
    @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
    @JsonKey(name: "refresh_token") String refreshToken,
  ) = LoggedUser;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
