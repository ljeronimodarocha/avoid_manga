import 'package:avoid_manga/data/services/client_http.dart';
import 'package:avoid_manga/domain/dtos/chapter_images.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

class ChapterClientHttp {
  final ClienteHttp _clienteHttp;

  ChapterClientHttp(this._clienteHttp);

  AsyncResult<ChapterImagesDTO> getVolumeImages(String volumeId) async {
    final response = await _clienteHttp.get(
      '${AppConstants.discoveryURL}/$volumeId',
      {},
      Options(
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    return response
        .map((data) => ChapterImagesDTO.fromJson(data.data))
        .mapError((ex) => Exception(ex));
  }
}
