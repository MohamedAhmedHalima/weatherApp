
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertask/modules/weatherTable.dart';
import 'package:weathertask/service/weatherServes.dart';
import 'package:intl/intl.dart';

import '../model/currentWeatherModel.dart';
import '../service/bloc/cubit.dart';
import '../service/bloc/states.dart';
class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  WeatherService currentWeather =WeatherService();
  @override

  TextStyle textStyle =const TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18);
  TextStyle infoStyle =const TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18,color: Color(0xFF5a5a5a));
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is LoadingData){
            CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            );
          }
        },
        builder: (BuildContext context, AppStates state)
        {
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
                  Icon(
                    Icons.wb_sunny_rounded,
                    color: Colors.orange,
                    size: 64.0,
                  ),
                  const   SizedBox(height: 10,),
                  Text(
                    "${ListData!.main!.temp}",
                    style: TextStyle(
                        fontSize: 46
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "${ListData.name}",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5a5a5a)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    "More Info",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "wind",
                                  style: textStyle,
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "pressure",
                                  style: textStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${ListData.wind!.speed}",
                                  style: infoStyle,
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "${ListData.main!.pressure}",
                                  style: infoStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "humidity",
                                  style: textStyle,
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "feels like",
                                  style: textStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${ListData.main!.humidity}",
                                  style: infoStyle,
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "${ListData.main!.feels_like}",
                                  style: infoStyle,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
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
