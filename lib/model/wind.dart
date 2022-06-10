class Wind{
 double ? speed;
 int? deg;

 Wind({this.speed, this.deg});

 factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json["speed"],
      deg: json["deg"],
    );
  }

 Map<String, dynamic> toJson() {
    return {
      "speed": this.speed,
      "deg": this.deg,
    };
  }
//


}