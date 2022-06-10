import 'package:weathertask/model/clouds.dart';
import 'package:weathertask/model/coord.dart';
import 'package:weathertask/model/main_temp.dart';
import 'package:weathertask/model/sys.dart';
import 'package:weathertask/model/weather.dart';
import 'package:weathertask/model/wind.dart';


class CurrentWeatherModel{
 Coord ? coord;
 List<Weather> ? weather;
  String ? base;
 MainTemp ? main ;
  int ? visibility;
 Wind ? wind ;
 Clouds ? clouds;
 int ? dt ;
 Sys ? sys ;
 int ? timezone;
 int ? id ;
 String ? name ;
  int ? cod ;

 CurrentWeatherModel(
      {
        this.coord,
      this.weather,
       this.base,
      this.main,
       this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
       this.cod
      });

 factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
       coord: Coord.fromJson(json["coord"]),

      weather: (json['weather'] as List)
          .map((w) => Weather.fromJson(w))
          .toList() ,
       base: json["base"],
      main: MainTemp.fromJson(json["main"]),
       visibility: json["visibility"],
      wind: Wind.fromJson(json["wind"]),
     clouds: Clouds.fromJson(json["clouds"]),
      dt: json["dt"],
     sys: Sys.fromJson(json["sys"]),
      timezone: json["timezone"],
      id: json["id"],
      name: json["name"],
       cod: json["cod"],
    );
  }


}