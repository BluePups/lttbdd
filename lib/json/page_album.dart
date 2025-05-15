import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptrinhtbdd/json/json_data.dart';

class PageAlbum extends StatelessWidget {
  const PageAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(
        future: docDuLieu(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            return Center(
              child: Text("Error"),
            );
          var list = snapshot.data!;
          return ListView.separated(
            itemBuilder: (context, index) {
              Album alb = list[index];
              return ListTile(
                leading: Text("${alb.id}"),
                title: Text("${alb.title}"),
                subtitle: Text("${alb.url}"),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: list.length
          );
        }
      ),
    );
  }
}
