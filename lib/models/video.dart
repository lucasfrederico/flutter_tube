class Video {
  final String id;
  final String title;
  final String thumbImage;
  final String channelTitle;

  Video({this.id, this.title, this.thumbImage, this.channelTitle});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumbImage: json['snippet']['thumbnails']['high']['url'],
      channelTitle: json['snippet']['channelTitle'],
    );
  }
}
