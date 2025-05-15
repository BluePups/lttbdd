import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laptrinhtbdd/commercial_app/models/model.dart';

class PageFruitStream extends StatelessWidget {
  const PageFruitStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Stream"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder(
        stream: FruitSnapShot.getFruitStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return Center(child: Text("Lỗi: ${snapshot.error.toString()}"));
          }

          if(!snapshot.hasData) {
            print(snapshot.data); // Xem dữ liệu từ Supabase
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Loading.............."),
                ],
              ),
            );
          }
          var fruits = snapshot.data!;
          return GridView.extent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.75,
            children: fruits.map(
                (fruit) {
                  return Card(
                    child: GestureDetector(
                      child: Column(
                          children: [
                      Expanded(
                      child: Container(
                      child: Image.network(fruit.anh?? ""),
                      ),
                      ),
                      Text(fruit.ten, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      Text("${fruit.gia ?? 0} vnd")
                      ]
                      ),
                    ),
                  );
                }
            ).toList(),
            );
        }
      ),
    );
  }
}
