class Coord{
  double ? lat,lon ;

  Coord({this.lat, this.lon});


  Map<String, dynamic> toJson() {
    return {
      "lat": this.lat,
      "lon": this.lon,
    };
  }

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: json["lat"],
      lon: json["lon"],
    );
  }
//

}