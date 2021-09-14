import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:movie_flutter/src/models/actores_model.dart';

import 'package:movie_flutter/src/models/pelicula_model.dart';

Future<List<Pelicula>> _baseRequest(Uri url) async {
  final resp = await http.get(url);
  final decodedData = json.decode(resp.body);
  final peliculas = new Peliculas.fromJsonList(decodedData['results']);
  return peliculas.items;
}

class PeliculasProvider {
  String _apikey = '9b9fedb4fde07d66cbf7535f16dc442b';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularesPage = 0;
  bool _cargando = false;

  // User_Stream
  // List<Pelicula> _populares = new List();
  List<Pelicula> _populares = [];
  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void dsposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});
    return await _baseRequest(url);
  }

  Future<List<Pelicula>> getPortada() async {
    // semaforo de consulta duplicados -------------
    if (_cargando) return [];
    _cargando = true;
    // ---------------------------------------------
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await _baseRequest(url);
    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getCast(String peliculaId) async {
    final url = Uri.https(_url, '3/movie/$peliculaId/credits',
        {'api_key': _apikey, 'language': _language});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodedData['cast']);
    return cast.actores;
  }

  Future<List<Pelicula>> buscarPelicula(String filter) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apikey, 'language': _language, 'query': filter});
    return await _baseRequest(url);
  }
}
