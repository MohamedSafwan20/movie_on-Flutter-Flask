class Movie {
  String name;
  String image;
  String description;
  String genres;
  String streamingLinks;

  Movie.name(this.name, this.image, this.description, this.genres,
      this.streamingLinks);

  Movie.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        description = json['description'],
        genres = json['genres'],
        streamingLinks = json['streamingLinks'];
}
