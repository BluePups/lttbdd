import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laptrinhtbdd/commercial_app/admin_pages/fruits_page_admin.dart';
import 'package:laptrinhtbdd/commercial_app/models/model.dart';
import 'package:laptrinhtbdd/commercial_app/models/supabase_helper.dart';

class FruitsAddPage extends StatefulWidget {
  const FruitsAddPage({super.key});

  @override
  State<FruitsAddPage> createState() => _FruitsAddPageState();
}

class _FruitsAddPageState extends State<FruitsAddPage> {
  XFile? xFile;
  TextEditingController txtID = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMoTa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme sản phẩm"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 300,
                child: xFile == null ? Icon(Icons.image, size: 50,) : Image.file(File(xFile!.path)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      var imagePicker = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(imagePicker != null) {
                        setState(() {
                          xFile = imagePicker;
                        });
                      }
                    },
                    child: Text("Chọn ảnh")
                  ),
                  SizedBox(width: 15,),
                ],
              ),
              TextField(
                controller: txtID,
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
                decoration: InputDecoration(
                  labelText: "ID",
                ),
              ),
              TextField(
                controller: txtTen,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Tên",
                ),
              ),
              TextField(
                controller: txtGia,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Giá",
                ),
              ),
              TextField(
                controller: txtMoTa,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Mô tả",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      if(xFile != null) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Đang thêm ${txtTen.text}..."),
                            duration: Duration(seconds: 5)
                          )
                        );
                        var imageUrl = await uploadImage(
                          image: File(xFile!.path),
                          bucket: "images",
                          path: "images/fruit_${txtID.text}.jpg",
                        );
                        Fruit fruit = Fruit(
                          id: int.parse(txtID.text),
                          ten: txtTen.text,
                          gia: int.parse(txtGia.text),
                          moTa: txtMoTa.text,
                          anh: imageUrl,
                        );
                        FruitSnapShot.insert(fruit);
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Đã thêm ${txtTen.text}"),
                            duration: Duration(seconds: 5),
                          )
                        );
                      }
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FruitsPageAdmin(),)
                      );
                    },
                    child: Text("Thêm"),
                  ),
                  SizedBox(width: 15,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
