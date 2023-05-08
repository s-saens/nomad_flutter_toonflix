class Webtoon {
  final String title, thumb, id;

  Webtoon(this.title, this.thumb, this.id);

  factory Webtoon.fromJson(Map<String, dynamic> json) {
    return Webtoon(json['title'], json['thumb'], json['id']);
  }
}
