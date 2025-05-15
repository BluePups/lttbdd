import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PageGetStorageDemo extends StatefulWidget {
  const PageGetStorageDemo({super.key});

  @override
  State<PageGetStorageDemo> createState() => _PageGetStorageDemoState();
}

class _PageGetStorageDemoState extends State<PageGetStorageDemo> {
  late int count = 0;
  late GetStorage box;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Storage Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("${count}"),
            ElevatedButton(
              onPressed: () async{
              box.write("counter", ++count);
              setState(() {
                count = box.read("counter");
              });
            }, child: Text("Tăng"))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initGetStorage();
  }

  Future<void> initGetStorage() async{
    await GetStorage.init();
    box = GetStorage();
    setState(() {
      count = box.read("counter") ?? 0;
    });
  }
}
