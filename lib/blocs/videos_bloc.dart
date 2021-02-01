import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_tube/api.dart';
import 'package:flutter_tube/models/video.dart';

class VideosBloc implements BlocBase {
  Api api;
  List<Video> videos;

  final StreamController _streamController = StreamController();

  Stream get outVideos => _streamController.stream;

  final StreamController _searchStreamController = StreamController();

  Sink get inSearch => _streamController.sink;

  VideosBloc() {
    api = Api();
    _searchStreamController.stream.listen(_search);
  }

  void _search(String search) async {
    videos = await api.search(search);
  }

  @override
  void addListener(void Function() listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    _streamController.close();
    _searchStreamController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(void Function() listener) {
    // TODO: implement removeListener
  }
}
