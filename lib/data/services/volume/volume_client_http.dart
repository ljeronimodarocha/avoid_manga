import 'package:avoid_manga/data/services/client_http.dart';
import 'package:avoid_manga/domain/entities/volume_entity.dart';
import 'package:avoid_manga/utils/app_constant.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

class VolumeClientHttp {
  final ClienteHttp _clienteHttp;

  VolumeClientHttp(this._clienteHttp);

  AsyncResult<List<Volume>> getVolumes(String mangaId) async {
    final response = await _clienteHttp.get(
      '${AppConstants.baseUrl}/manga/$mangaId/aggregate',
      {},
      Options(
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    return response.map(_convertListVolume).mapError((ex) => Exception(ex));
  }

  List<Volume> _convertListVolume(Response response) {
    var map = response.data['volumes'] as Map;
    var list = map.values.toList();
    return list
        .where(
            (volume) => volume is Map && int.tryParse(volume['volume']) != null)
        .map((volume) => Volume.fromJson(volume))
        .toList();
  }
}
