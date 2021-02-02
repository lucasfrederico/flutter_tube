class Video {
  final String id;
  final String title;
  final String thumbImage;
  final String channelTitle;

  Video({this.id, this.title, this.thumbImage, this.channelTitle});

  factory Video.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id')) {
      return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        thumbImage: json['snippet']['thumbnails']['high']['url'],
        channelTitle: json['snippet']['channelTitle'],
      );
    }
    return Video(
      id: json['videoId'],
      title: json['title'],
      thumbImage: json['thumbImage'],
      channelTitle: json['channelTitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'videoId': id,
      'title': title,
      'thumbImage': thumbImage,
      'channelTitle': channelTitle
    };
  }
}
