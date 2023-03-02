class AstronomyPictureOfDay {
  final String explanation;
  final String title;
  final String url;
  final String hdurl;

  const AstronomyPictureOfDay(
      {required this.explanation,
      required this.title,
      required this.url,
      required this.hdurl});

  factory AstronomyPictureOfDay.fromJson(Map<String, dynamic> json) {
    return AstronomyPictureOfDay(
      explanation: json['explanation'],
      title: json['title'],
      url: json['url'],
      hdurl: json['hdurl'],
    );
  }
}
