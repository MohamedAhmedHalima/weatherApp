class FiveDaysData {
  String? dataTime;
  int? temp;

  FiveDaysData({this.dataTime, this.temp});

  factory FiveDaysData.fromJson(Map<String, dynamic> json) {
    return FiveDaysData(
      dataTime: json["dataTime"],
      temp: int.parse(json["temp"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "dataTime": this.dataTime,
      "temp": this.temp,
    };
  }
//


}
