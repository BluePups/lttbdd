import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:laptrinhtbdd/Layout/chitietsp.dart';
import 'package:laptrinhtbdd/Layout/list_view.dart';

class PageGridView extends StatefulWidget {
  PageGridView({super.key});

  @override
  State<PageGridView> createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {
  String image = "https://th.bing.com/th/id/OIP.SH-MxwmIu9BlhY96-rdAtQHaGG?rs=1&pid=ImgDetMain";
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Grid View"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(children:[
            Icon(Icons.shopping_cart, color: Colors.red, size: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Text("${counter}", style: TextStyle(color: Colors.white, fontSize: 15),),
            )
          ]),
          SizedBox(width: 30,)
        ],
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.8,
        children: data.map(
        (e) {
          return Card(
            child: GestureDetector(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.network(image),
                    ),
                  ),
                  Text(e.ten),
                  Text("${e.gia}"),
                ],
              ),
              onTap: () async{
                String message = await
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PageChitiet())
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
              },
            ),
          );
        },
        ).toList(),
      ),
    );
  }
}
