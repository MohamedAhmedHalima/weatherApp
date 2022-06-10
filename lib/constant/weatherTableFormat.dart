import 'package:flutter/material.dart';
import 'package:weathertask/modules/WeatherCard.dart';

import '../service/bloc/cubit.dart';
class rowgetfromdatabase extends StatefulWidget {
  Map model;


  rowgetfromdatabase({required this.model});

  @override
  State<rowgetfromdatabase> createState() => _rowgetfromdatabaseState();
}

class _rowgetfromdatabaseState extends State<rowgetfromdatabase> {
  @override
  Widget build(BuildContext context) {
    return  Dismissible(
      key: Key(widget.model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "tmp",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "${widget.model['tmp']}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${widget.model['title']}",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "${widget.model['date']}",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            // IconButton(
            //     icon: Icon(
            //       Icons.check_box,
            //       color: Colors.green,
            //     ),
            //     onPressed: () {
            //       // AppCubit.get(context)
            //       //     .updatindatabase(state: "Done", id: model["id"]);
            //     }),
            IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.blueGrey,
                ),
                onPressed: () {
                  setState(() {

                  });
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          // TextButton(
                          //   onPressed: () {
                          //     setState(() {
                          //
                          //     });
                          //     AppCubit.get(context).Deletdatabase(
                          //         id: widget.model["id"]);
                          //   },
                          //   child: const Text('Delete'),
                          // ),
                        ],
                      title: const Text('Details'),
                      content: Container(
                        height: 300,
                          child: WeatherCared(temp:   "${widget.model['tmp']}", name:   "${widget.model['title']}"))
                    )

                  );


                })
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).Deletdatabase(id:widget. model["id"]);
      },
    );
  }
}



