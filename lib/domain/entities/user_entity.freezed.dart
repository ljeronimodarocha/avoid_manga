// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _User.fromJson(json);
    case 'notLogged':
      return NotLoggedUser.fromJson(json);
    case 'logged':
      return LoggedUser.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'User',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$User {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)
        $default, {
    required TResult Function() notLogged,
    required TResult Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)
        logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)?
        $default, {
    TResult? Function()? notLogged,
    TResult? Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)?
        logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)?
        $default, {
    TResult Function()? notLogged,
    TResult Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)?
        logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_User value) $default, {
    required TResult Function(NotLoggedUser value) notLogged,
    required TResult Function(LoggedUser value) logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_User value)? $default, {
    TResult? Function(NotLoggedUser value)? notLogged,
    TResult? Function(LoggedUser value)? logged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_User value)? $default, {
    TResult Function(NotLoggedUser value)? notLogged,
    TResult Function(LoggedUser value)? logged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@LoggedUserResponseConverter() String grantType,
      String clientId,
      String clientSecre});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grantType = null,
    Object? clientId = null,
    Object? clientSecre = null,
  }) {
    return _then(_$UserImpl(
      null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
      null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      null == clientSecre
          ? _value.clientSecre
          : clientSecre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(@LoggedUserResponseConverter() this.grantType, this.clientId,
      this.clientSecre,
      {final String? $type})
      : $type = $type ?? 'default';

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @LoggedUserResponseConverter()
  final String grantType;
  @override
  final String clientId;
  @override
  final String clientSecre;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'User(grantType: $grantType, clientId: $clientId, clientSecre: $clientSecre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.grantType, grantType) ||
                other.grantType == grantType) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientSecre, clientSecre) ||
                other.clientSecre == clientSecre));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, grantType, clientId, clientSecre);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)
        $default, {
    required TResult Function() notLogged,
    required TResult Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)
        logged,
  }) {
    return $default(grantType, clientId, clientSecre);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)?
        $default, {
    TResult? Function()? notLogged,
    TResult? Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)?
        logged,
  }) {
    return $default?.call(grantType, clientId, clientSecre);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)?
        $default, {
    TResult Function()? notLogged,
    TResult Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)?
        logged,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(grantType, clientId, clientSecre);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_User value) $default, {
    required TResult Function(NotLoggedUser value) notLogged,
    required TResult Function(LoggedUser value) logged,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_User value)? $default, {
    TResult? Function(NotLoggedUser value)? notLogged,
    TResult? Function(LoggedUser value)? logged,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_User value)? $default, {
    TResult Function(NotLoggedUser value)? notLogged,
    TResult Function(LoggedUser value)? logged,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(@LoggedUserResponseConverter() final String grantType,
      final String clientId, final String clientSecre) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @LoggedUserResponseConverter()
  String get grantType;
  String get clientId;
  String get clientSecre;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotLoggedUserImplCopyWith<$Res> {
  factory _$$NotLoggedUserImplCopyWith(
          _$NotLoggedUserImpl value, $Res Function(_$NotLoggedUserImpl) then) =
      __$$NotLoggedUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotLoggedUserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$NotLoggedUserImpl>
    implements _$$NotLoggedUserImplCopyWith<$Res> {
  __$$NotLoggedUserImplCopyWithImpl(
      _$NotLoggedUserImpl _value, $Res Function(_$NotLoggedUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$NotLoggedUserImpl implements NotLoggedUser {
  const _$NotLoggedUserImpl({final String? $type})
      : $type = $type ?? 'notLogged';

  factory _$NotLoggedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotLoggedUserImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'User.notLogged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotLoggedUserImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)
        $default, {
    required TResult Function() notLogged,
    required TResult Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)
        logged,
  }) {
    return notLogged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)?
        $default, {
    TResult? Function()? notLogged,
    TResult? Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)?
        logged,
  }) {
    return notLogged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)?
        $default, {
    TResult Function()? notLogged,
    TResult Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)?
        logged,
    required TResult orElse(),
  }) {
    if (notLogged != null) {
      return notLogged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_User value) $default, {
    required TResult Function(NotLoggedUser value) notLogged,
    required TResult Function(LoggedUser value) logged,
  }) {
    return notLogged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_User value)? $default, {
    TResult? Function(NotLoggedUser value)? notLogged,
    TResult? Function(LoggedUser value)? logged,
  }) {
    return notLogged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_User value)? $default, {
    TResult Function(NotLoggedUser value)? notLogged,
    TResult Function(LoggedUser value)? logged,
    required TResult orElse(),
  }) {
    if (notLogged != null) {
      return notLogged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotLoggedUserImplToJson(
      this,
    );
  }
}

abstract class NotLoggedUser implements User {
  const factory NotLoggedUser() = _$NotLoggedUserImpl;

  factory NotLoggedUser.fromJson(Map<String, dynamic> json) =
      _$NotLoggedUserImpl.fromJson;
}

/// @nodoc
abstract class _$$LoggedUserImplCopyWith<$Res> {
  factory _$$LoggedUserImplCopyWith(
          _$LoggedUserImpl value, $Res Function(_$LoggedUserImpl) then) =
      __$$LoggedUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@JsonKey(name: "access_token") String token,
      @JsonKey(name: "expires_in") num expiresIn,
      @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
      @JsonKey(name: "refresh_token") String refreshToken});
}

/// @nodoc
class __$$LoggedUserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$LoggedUserImpl>
    implements _$$LoggedUserImplCopyWith<$Res> {
  __$$LoggedUserImplCopyWithImpl(
      _$LoggedUserImpl _value, $Res Function(_$LoggedUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? expiresIn = null,
    Object? refreshExpiresIn = null,
    Object? refreshToken = null,
  }) {
    return _then(_$LoggedUserImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as num,
      null == refreshExpiresIn
          ? _value.refreshExpiresIn
          : refreshExpiresIn // ignore: cast_nullable_to_non_nullable
              as num,
      null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoggedUserImpl implements LoggedUser {
  const _$LoggedUserImpl(
      @JsonKey(name: "access_token") this.token,
      @JsonKey(name: "expires_in") this.expiresIn,
      @JsonKey(name: "refresh_expires_in") this.refreshExpiresIn,
      @JsonKey(name: "refresh_token") this.refreshToken,
      {final String? $type})
      : $type = $type ?? 'logged';

  factory _$LoggedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoggedUserImplFromJson(json);

  @override
  @JsonKey(name: "access_token")
  final String token;
  @override
  @JsonKey(name: "expires_in")
  final num expiresIn;
  @override
  @JsonKey(name: "refresh_expires_in")
  final num refreshExpiresIn;
  @override
  @JsonKey(name: "refresh_token")
  final String refreshToken;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'User.logged(token: $token, expiresIn: $expiresIn, refreshExpiresIn: $refreshExpiresIn, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedUserImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.refreshExpiresIn, refreshExpiresIn) ||
                other.refreshExpiresIn == refreshExpiresIn) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, token, expiresIn, refreshExpiresIn, refreshToken);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedUserImplCopyWith<_$LoggedUserImpl> get copyWith =>
      __$$LoggedUserImplCopyWithImpl<_$LoggedUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)
        $default, {
    required TResult Function() notLogged,
    required TResult Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)
        logged,
  }) {
    return logged(token, expiresIn, refreshExpiresIn, refreshToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)?
        $default, {
    TResult? Function()? notLogged,
    TResult? Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)?
        logged,
  }) {
    return logged?.call(token, expiresIn, refreshExpiresIn, refreshToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(@LoggedUserResponseConverter() String grantType,
            String clientId, String clientSecre)?
        $default, {
    TResult Function()? notLogged,
    TResult Function(
            @JsonKey(name: "access_token") String token,
            @JsonKey(name: "expires_in") num expiresIn,
            @JsonKey(name: "refresh_expires_in") num refreshExpiresIn,
            @JsonKey(name: "refresh_token") String refreshToken)?
        logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(token, expiresIn, refreshExpiresIn, refreshToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_User value) $default, {
    required TResult Function(NotLoggedUser value) notLogged,
    required TResult Function(LoggedUser value) logged,
  }) {
    return logged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_User value)? $default, {
    TResult? Function(NotLoggedUser value)? notLogged,
    TResult? Function(LoggedUser value)? logged,
  }) {
    return logged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_User value)? $default, {
    TResult Function(NotLoggedUser value)? notLogged,
    TResult Function(LoggedUser value)? logged,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoggedUserImplToJson(
      this,
    );
  }
}

abstract class LoggedUser implements User {
  const factory LoggedUser(
          @JsonKey(name: "access_token") final String token,
          @JsonKey(name: "expires_in") final num expiresIn,
          @JsonKey(name: "refresh_expires_in") final num refreshExpiresIn,
          @JsonKey(name: "refresh_token") final String refreshToken) =
      _$LoggedUserImpl;

  factory LoggedUser.fromJson(Map<String, dynamic> json) =
      _$LoggedUserImpl.fromJson;

  @JsonKey(name: "access_token")
  String get token;
  @JsonKey(name: "expires_in")
  num get expiresIn;
  @JsonKey(name: "refresh_expires_in")
  num get refreshExpiresIn;
  @JsonKey(name: "refresh_token")
  String get refreshToken;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoggedUserImplCopyWith<_$LoggedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
