import 'package:flutter/material.dart';

import '../service/bloc/cubit.dart';
Widget rowgetfromdatabase(Map model, BuildContext context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.blue,
          child: Text(
            "${model['tmp']}",
            style: TextStyle(color: Colors.white),
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
                "${model['title']}",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "${model['date']}",
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
        // IconButton(
        //     icon: Icon(
        //       Icons.delete,
        //       color: Colors.redAccent,
        //     ),
        //     onPressed: () {
        //
        //       AppCubit.get(context).Deletdatabase(id: model["id"]);
        //       // AppCubit.get(context)
        //       //     .updatindatabase(state: "archive", id: model["id"]);
        //     })
      ],
    ),
  ),
  onDismissed: (direction) {
    AppCubit.get(context).Deletdatabase(id: model["id"]);
  },
);
