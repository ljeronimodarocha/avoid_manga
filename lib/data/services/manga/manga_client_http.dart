import 'package:avoid_manga/data/repositories/auth/auth_repository.dart';
import 'package:avoid_manga/data/services/auth/auth_local_storage.dart';
import 'package:avoid_manga/data/services/client_http.dart';
import 'package:avoid_manga/domain/dtos/manga_dto.dart';
import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/domain/entities/user_entity.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

class MangaClientHttp {
  final ClienteHttp _clienteHttp;
  final AuthRepository _authRepository;
  final AuthLocalStorage _authLocalStorage;

  MangaClientHttp(
      this._clienteHttp, this._authRepository, this._authLocalStorage);

  AsyncResult<List<Manga>> getMangas(String? name, int offset) async {
    final response = await _clienteHttp.get(
      '${AppConstants.baseUrl}/manga',
      {
        'title': name,
        'limit': 20,
        'offset': offset,
        'availableTranslatedLanguage[]': ['pt-br'],
        'order[latestUploadedChapter]': 'desc',
        'includes[]': ['cover_art'],
      },
      Options(
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    return response.map(_convertListManga).mapError((ex) => Exception(ex));
  }

  AsyncResult<List<Manga>> getMangasFavorited(String? name, int offset) async {
    var user = await _authLocalStorage.getUser().getOrNull();
    if (user == null) return Failure(Exception("User not logged"));

    if (!user.isTokenValid()) {
      user = await _authRepository.refreshToken().getOrNull();
      if (user == null) return Failure(Exception("Unable to refresh token"));
    }
    final response = await _clienteHttp.get(
      '${AppConstants.baseUrl}/user/follows/manga',
      {
        'limit': 20,
        'offset': offset,
        'includes[]': ['cover_art'],
      },
      Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      ),
    );
    return response.map(_convertListManga).mapError((ex) => Exception(ex));
  }

  AsyncResult<Unit> updateReadManga(String id) async {
    await _clienteHttp.get(
      '${AppConstants.baseUrl}/manga/$id/status',
      {
        'id': id,
      },
      Options(
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    return AsyncResult.value(Success.unit());
  }

  AsyncResult<Unit> followManga(String id) async {
    var user = await _authLocalStorage.getUser().getOrNull();
    if (user == null) return Failure(Exception("User not logged"));

    if (!user.isTokenValid()) {
      user = await _authRepository.refreshToken().getOrNull();
      if (user == null) return Failure(Exception("Unable to refresh token"));
    }
    final response = await _clienteHttp.post(
      '${AppConstants.baseUrl}/manga/$id/follow',
      {},
      Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      ),
    );
    if (response.isSuccess()) {
      return AsyncResult.value(Success.unit());
    } else {
      return Failure(Exception("Unable to follow manga"));
    }
  }

  AsyncResult<Unit> unfollowManga(String id) async {
    var user = await _authLocalStorage.getUser().getOrNull();
    if (user == null) return Failure(Exception("User not logged"));

    if (!user.isTokenValid()) {
      user = await _authRepository.refreshToken().getOrNull();
      if (user == null) return Failure(Exception("Unable to refresh token"));
    }
    final response = await _clienteHttp.delete(
      '${AppConstants.baseUrl}/manga/$id/follow',
      {},
      Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      ),
    );
    if (response.isSuccess()) {
      return AsyncResult.value(Success.unit());
    } else {
      return Failure(Exception("Unable to follow manga"));
    }
  }

  AsyncResult<bool> isFollowManga(String id) async {
    var user = await _authLocalStorage.getUser().getOrNull();
    if (user == null) return Failure(Exception("User not logged"));

    if (!user.isTokenValid()) {
      user = await _authRepository.refreshToken().getOrNull();
      if (user == null) return Failure(Exception("Unable to refresh token"));
    }

    final response = await _clienteHttp.get(
      '${AppConstants.baseUrl}/user/follows/manga/$id',
      {
        'id': id,
      },
      Options(
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        validateStatus: (status) => status == 200 || status == 404,
      ),
    );

    final res = response.getOrNull();
    if (res?.statusCode == 404) {
      return const Success(false);
    }

    return const Success(true);
  }

  List<Manga> _convertListManga(Response response) {
    var list = response.data['data'] as List;
    Iterable<MangaDTO> dto = list.map((manga) => MangaDTO.fromJson(manga));
    return dto.map((dto) => Manga.convertToManga(dto)).toList();
  }
}
