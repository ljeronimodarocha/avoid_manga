import 'package:avoid_manga/data/services/client_http.dart';
import 'package:avoid_manga/domain/dtos/manga_dto.dart';
import 'package:avoid_manga/domain/entities/manga_entity.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

class MangaClientHttp {
  final ClienteHttp _clienteHttp;

  MangaClientHttp(this._clienteHttp);

  AsyncResult<List<Manga>> getMangas(int offset) async {
    final response = await _clienteHttp.get(
      '${AppConstants.baseUrl}/manga',
      {
        'limit': 20,
        'offset': offset,
        'availableTranslatedLanguage[]': ['pt-br'],
        'order[latestUploadedChapter]': 'desc',
      },
      Options(
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    return response.map(convertListManga).mapError((ex) => Exception(ex));
  }

  List<Manga> convertListManga(Response response) {
    var list = response.data['data'] as List;
    Iterable<MangaDTO> dto = list.map((manga) => MangaDTO.fromJson(manga));
    return dto.map((dto) => Manga.convertToManga(dto)).toList();
  }
}
