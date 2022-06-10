import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant/weatherTableFormat.dart';
import '../service/bloc/cubit.dart';
import '../service/bloc/states.dart';
class WeatherTableList extends StatefulWidget {
  const WeatherTableList({Key? key}) : super(key: key);

  @override
  State<WeatherTableList> createState() => _WeatherTableListState();
}

class _WeatherTableListState extends State<WeatherTableList> {
  @override
  Widget build(BuildContext context) {
    return    BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {    },
        builder: (BuildContext context, AppStates state) {
          var    taske = AppCubit.get(context).weatherTable;

          return   Scaffold(
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
              body: TableTaskes(taske: taske ));


        }
    );

  }
}

Widget  TableTaskes({
  List<Map> ? taske,
}) =>
    ListView.separated(
        itemBuilder: (context, index) =>
            rowgetfromdatabase(taske![index], context),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: taske!.length);

