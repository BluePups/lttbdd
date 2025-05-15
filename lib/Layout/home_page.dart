
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "Hello";

  TextEditingController txtName = TextEditingController();
  TextEditingController txtNgaySinh = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        backgroundColor: Colors.lightGreenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello Kz', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.red
            )),
            Text("Hello ${txtName.text}"),
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                  labelText: "Name"
              ),
            ),
            TextField(
              controller: txtNgaySinh,
              decoration: InputDecoration(
                  labelText: "Ngay Sinh"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: (){
                      if(message == "Hello"){
                        setState(() {
                          message = "Click";
                        });
                      }else{
                        setState(() {
                          message = "Click ";
                        });
                      }
                    },
                    child: Text(message)
                ),
                SizedBox(width: 10,),

              ],
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}