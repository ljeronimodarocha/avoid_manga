import 'dart:convert';

import 'package:avoid_manga/data/services/local_storage.dart';
import 'package:result_dart/result_dart.dart';

const _favoritedKey = '_favoritedKey';

class MangaLocalStorage {
  final LocalStorage _localStorage;

  MangaLocalStorage(this._localStorage);

  AsyncResult<List<String>> getFavoritesManga() async {
    return await _localStorage
        .getData(_favoritedKey)
        .map((json) => jsonDecode(json));
  }

  AsyncResult<Unit> saveFavoritesMangas(String id) async {
    var ids = await getFavoritesManga().getOrDefault(List<String>.empty());
    ids.add(id);
    await _localStorage.removeData(_favoritedKey);
    await _localStorage.saveData(_favoritedKey, jsonEncode(ids));
    return Success.unit();
  }

  AsyncResult<Unit> removeFavoritedManga(String id) async {
    var favoritesMangas = await getFavoritesManga().getOrNull();
    if (favoritesMangas == null || favoritesMangas.isEmpty) {
      return Success.unit();
    }
    favoritesMangas.where((element) => element != id);
    await _localStorage.removeData(_favoritedKey);
    await _localStorage.saveData(_favoritedKey, jsonEncode(favoritesMangas));
    return Success.unit();
  }
}
