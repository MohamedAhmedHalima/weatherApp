import 'package:flutter/material.dart';
class MoreInfoCard extends StatelessWidget {
  String  speed ,feels_like, pressure,humidity;

  MoreInfoCard({required this.speed, required this.feels_like,required this.pressure,required this.humidity}); //

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle =const TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18);
    TextStyle infoStyle =const TextStyle(fontWeight: FontWeight.w400 ,fontSize: 18,color: Color(0xFF5a5a5a));
    return   Card(
      child: Container (
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
                      "${speed}",
                      style: infoStyle,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "${pressure}",
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
                      "${humidity}",
                      style: infoStyle,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "${feels_like}",
                      style: infoStyle,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
