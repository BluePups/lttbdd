import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laptrinhtbdd/commercial_app/admin_pages/fruits_page_admin.dart';
import 'package:laptrinhtbdd/commercial_app/models/model.dart';
import 'package:laptrinhtbdd/commercial_app/models/supabase_helper.dart';
import 'package:laptrinhtbdd/helper/dialogs.dart';

class FruitsUpdatePage extends StatefulWidget {
  FruitsUpdatePage({super.key, required this.fruit});
  Fruit fruit;

  @override
  State<FruitsUpdatePage> createState() => _FruitsUpdatePageState();
}

class _FruitsUpdatePageState extends State<FruitsUpdatePage> {
  XFile? xFile;
  TextEditingController txtID = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMoTa = TextEditingController();
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chỉnh sửa sản phẩm"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 300,
                child: xFile == null ? Image.network(widget.fruit.anh?? "Linh mac dinh") : Image.file(File(xFile!.path)),
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
                readOnly: true,
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
                      Fruit fruit = widget.fruit;
                      showSnackBar(context, message: "Đang cập nhật ${fruit.ten}...", seconds: 10);
                      if(xFile != null) {
                        imageUrl = await uploadImage(
                          image: File(xFile!.path),
                          bucket: "images",
                          path: "images/fruit_${txtID.text}.jpg",
                          upsert: true,
                        );
                        fruit.anh = imageUrl;
                      }
                      fruit.ten = txtTen.text;
                      fruit.gia = int.parse(txtGia.text);
                      fruit.moTa = txtMoTa.text;
                      await FruitSnapShot.update(fruit);
                      showSnackBar(context, message: "Đã cập nhật");
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => FruitsPageAdmin(),)
                      );
                    },
                    child: Text("Cập nhật"),
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

  @override
  void initState() {
    super.initState();
    txtID.text = widget.fruit.id.toString();
    txtTen.text = widget.fruit.ten;
    txtGia.text = widget.fruit.gia.toString();
    txtMoTa.text = widget.fruit.moTa?? "";
  }
}
