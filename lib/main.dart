import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertask/api/dio.dart';
import 'package:weathertask/service/bloc/cubit.dart';
import 'package:weathertask/service/bloc/states.dart';

import 'modules/MainPage.dart';
import 'service/weatherServes.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context)=> AppCubit()..getWeatherDataWithLatLong()..creatdatabase(),
    child: BlocConsumer<AppCubit , AppStates>(
      listener: (BuildContext context, AppStates state) {},
    builder: (BuildContext context, AppStates state) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),

        );
    }
    )

    );
  }
}
