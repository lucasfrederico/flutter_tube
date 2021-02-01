import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_tube/api.dart';
import 'package:flutter_tube/models/video.dart';

class VideosBloc implements BlocBase {
  Api api;
  List<Video> videos;

  final StreamController<List<Video>> _streamController = StreamController<List<Video>>();

  Stream get outVideos => _streamController.stream;

  final StreamController<String> _searchStreamController = StreamController<String>();

  Sink get inSearch => _searchStreamController.sink;

  VideosBloc() {
    api = Api();
    _searchStreamController.stream.listen(_search);
  }

  void _search(String search) async {
    if (search != null) {
      _streamController.sink.add([]);
      videos = await api.search(search);
    } else {
      videos += await api.nextPage();
    }

    _streamController.sink.add(videos);
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
