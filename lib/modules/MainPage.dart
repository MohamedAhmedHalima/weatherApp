
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertask/modules/MoreInfoCard.dart';
import 'package:weathertask/modules/weatherTable.dart';
import 'package:weathertask/service/weatherServes.dart';
import 'package:intl/intl.dart';

import '../constant/snakbar.dart';
import '../model/currentWeatherModel.dart';
import '../service/bloc/cubit.dart';
import '../service/bloc/states.dart';
import 'WeatherCard.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  WeatherService currentWeather =WeatherService();

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is getDataSucces){
            if (state.code.isNotEmpty){
              showSnackBar(context,state.message);
            }
          }
        },
        builder: (BuildContext context, AppStates state)
        {
       //   icon_url = "http://openweathermap.org/img/w/$dataDecoded/weather/icon.png"
          TextEditingController serchBar = TextEditingController();
          DateFormat formatter = DateFormat('yyyy-MM-dd');
          var cubit =AppCubit.get(context);
          CurrentWeatherModel ? ListData =AppCubit.get(context).currentWeatherModel;
          return
            state is getDataSucces ?
          Scaffold(
            backgroundColor: const Color(0xFFf9f9f9),
            appBar: AppBar(
              title: const Text(
                "Weather App",
                style: TextStyle(
                    color: Colors.black
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFFf9f9f9),
              elevation: 0,
            ),
            body: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.white,
                  child: Center(
                    child: TextField(
                      controller: serchBar,
                      decoration: InputDecoration(
                          hintText: 'Search for something',
                          prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(icon: Icon(Icons.rocket_launch),onPressed: (){
                          if(serchBar.text.isNotEmpty) {
                                      cubit.getWeatherDataWithPlace(
                                          city: serchBar.text);
                                    }else{
                            showSnackBar(context, "Must write place");
                          }
                                  },)
                         ),
                    ),
                  ),
              ),
                ),
                  WeatherCared( name: "${ListData!.name}",temp: "${ListData.main!.temp}", ),
                  const SizedBox(height: 10,),
                  Text(
                    "More Info",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 20,),


                  MoreInfoCard(
                      speed:"${ ListData.wind!.speed}",
                    feels_like: "${ListData.main!.pressure}",
                    pressure: "${ListData.main!.humidity}",
                    humidity: "${ListData.main!.feels_like}"),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: ()async {
                          await cubit.insertdata(name: "${ListData.name}" ,
                              date:formatter.format(DateTime.parse(DateTime.now().toString())) ,
                              tmp: "${ListData.main!.temp.toString()}" );
                        },
                        child: Text('Save'),
                      ),
                      SizedBox(width: 20,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WeatherTableList()),
                          );
                          print("lengthlength ${cubit.weatherTable!.length}");
                        },
                        child: Text('to List'),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
          :
          const CircularProgressIndicator(
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          )
          ;
        }
    );
  }
  }
