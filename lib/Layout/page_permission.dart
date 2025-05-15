import 'package:flutter/material.dart';
import 'package:laptrinhtbdd/helper/permission.dart';
import 'package:permission_handler/permission_handler.dart';

class PageRequestPermission extends StatelessWidget {
  const PageRequestPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permisstion Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              String message;
              var status = await requestPermission(Permission.camera);
              if(status )
                message = "Quyền sử dụng camera đã được cấp ";
              else
                message = "Quyền sử dụng camera đã bị từ chối";
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    duration: Duration(seconds: 5) ,
                  )
              );
            },
            child: Text("Contact permisstion")
        ),
      ),
    );
  }
}