class MovieDetail {
  String name;
  String image;
  String description;
  String genres;
  List streamingLinks;

  MovieDetail.name(this.name, this.image, this.description, this.genres,
      this.streamingLinks);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        description = json['description'],
        genres = json['genres'],
        streamingLinks = json['links'];
}
