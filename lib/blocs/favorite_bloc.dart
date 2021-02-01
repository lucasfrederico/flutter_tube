import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_tube/models/video.dart';

class FavoriteBloc implements BlocBase {

  Map<String, Video> _favorites = {};

  final StreamController<Map<String, Video>> _favController = StreamController.broadcast();

  Stream<Map<String, Video>> get outFav => _favController.stream;

  void toggleFavorite(Video video) {
    if (_favorites.containsKey(video.id)) {
      _favorites.remove(video.id);
    } else {
      _favorites[video.id] = video;
    }

    _favController.sink.add(_favorites);
  }

  @override
  void addListener(void Function() listener) {
    // TODO: implement hasListeners
  }

  @override
  void dispose() {
    _favController.close();
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