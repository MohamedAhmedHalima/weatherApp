class Sys{
  // "type": 2,
  // "id": 2019646,
  // "country": "GB",
  // "sunrise": 1654746263,
  // "sunset": 1654805718
  String ? country;
  int ? type,id,sunrise,sunset;

  Sys({this.country, this.type, this.id, this.sunrise, this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json["country"],
      type:json["type"],
      id: json["id"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "country": this.country,
      "type": this.type,
      "id": this.id,
      "sunrise": this.sunrise,
      "sunset": this.sunset,
    };
  }
//


}