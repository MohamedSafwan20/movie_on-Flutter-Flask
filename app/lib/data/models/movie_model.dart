class Movie {
  String name;
  String image;

  Movie.name(this.name, this.image);

  Movie.fromJson(Map<String, dynamic> json)
      : name = json['title'],
        image = json['img'];
}
