import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertask/service/bloc/states.dart';

import '../../api/dio.dart';
import '../../model/currentWeatherModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  // AppCubite(AppStates initialState) : super(initialState);
  AppCubit() : super(Initstate());

  static AppCubit get(context) => BlocProvider.of(context);


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      await Geolocator.requestPermission();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }


  CurrentWeatherModel? currentWeatherModel;

  void getWeatherData({ required String city}) async {
    emit(LoadingData());
    await DioHelper.getData(
        url: "/weather?q=$city&appid=48db3897898723c996eda6f95b1a6d5e&units=metric")
        .then((value) {
      print("value${value.data}");
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);
      print("value value${currentWeatherModel!.wind!.speed}");
      emit(getDataSucces());
    })
        .catchError((error) {
      print("${error.toString()}");
      emit(DataError());
    });
  }

  void getWeatherDataWithLatLong(//{ required double lat ,long}
      ) async {
    emit(LoadingData());
    Position position = await determinePosition();
    double lat = position.latitude;
    double long = position.longitude;


    await DioHelper.getData(
        url: "/weather?lat=$lat&lon=$long&appid=48db3897898723c996eda6f95b1a6d5e&units=metric")
        .then((value) {
      print("value${value.data}");
      currentWeatherModel = CurrentWeatherModel.fromJson(value.data);
      print("value value${currentWeatherModel!.wind!.speed}");
      emit(getDataSucces());
    })
        .catchError((error) {
      print("${error.toString()}");
      emit(DataError());
    });
  }

  Database? database;
  List<Map> ? weatherTable;


  void creatdatabase() {
    openDatabase("todo.db", version: 1, onCreate: (database, version) {
      print("creat database");
      database
          .execute(
          "CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT, date TEXT , tmp TEXT)")
          .then((value) {
        print("create table ");
      }).catchError((error) {});
    }, onOpen: (database) {
      print("open database ");
      getfromdatabase(database);
    }).then((value) {
      print("open database ");
      database = value;
      //emit(CreatDataBase());
    });
  }

  insertdata({String? name, String? date, String? tmp}) async {
    await database!.transaction((txn) {
    return  txn
          .rawInsert(
          'INSERT INTO tasks (title ,date ,tmp ) VALUES ("$name" ,"$date", "$tmp" )')
          .then((value) {
        print("insert done");
      //  emit(InsertInDataBase());


        getfromdatabase(database);


      });
      //   .catchError((error) {
      //   print("error is $error");
      // });

    });
  }

  void getfromdatabase(database)  async{
    weatherTable =[];

    //emit(GetFormDataBaseLooding());
   await database.rawQuery("SELECT * FROM tasks").then((value) {
      //   taske = value;
      value.forEach((element) {
          weatherTable!.add(element);

      });
      print(value);
    //  emit(GetFormDataBase());
    });
  }

  void Deletdatabase({required  int ? id ,})async {
    await database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]) .then((value) {

     // emit(DeletInDataBase());
      getfromdatabase(database);
      //print(taske);

    }) ;
  }


}