import 'package:flutter/material.dart';

import '../constant/snakbar.dart';
class WeatherCared extends StatelessWidget {
 String temp ;
 String name ;


 WeatherCared({required this.temp,required this.name});

  @override
  Widget build(BuildContext context) {
    var size,height,width;

    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Center(
      child: Card(

        child: Container(
          width: width*.90,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const SizedBox(height: 20,),

              Icon(
                Icons.wb_sunny_rounded,
                color: Colors.orange,
                size: 64.0,
              ),
              const   SizedBox(height: 10,),
              Text(
                "$temp",
                style: TextStyle(
                    fontSize: 46
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                "${name}",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF5a5a5a)
                ),
              ),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
