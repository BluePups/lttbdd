import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageLuyenTap extends StatelessWidget {
  const PageLuyenTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Text("Trang Chủ"),
      ),
    );
  }
}
