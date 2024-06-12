class Movie {
  final String title;
  final String caption;
  final String url;

  Movie({
    required this.title,
    required this.caption,
    required this.url,
  });

  //TODO implement Movie.fromJson
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      // title: json['titleText']['text'],
      // caption: json['primaryImage']['caption']['plainText'],
      // url: json['primaryImage']['url'],
      title: json['results'][0]['titleText']['text'],
      caption: json['results'][0]['primaryImage']['caption']['plainText'],
      url: json['results'][0]['primaryImage']['url'],
    );
  }
}
