import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screen/about_me_screen.dart';
import 'package:flutter_application/service/api_service.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  // รายการเมนูชานมพร้อมราคาและรูปภาพ
  final List<Map<String, dynamic>> milkTeaMenu = [
    {'name': 'ชานมไต้หวัน', 'price': 50, 'image': 'images/ชานมไต้หวัน.jpg'},
    {'name': 'ชานมเนสคาเฟ', 'price': 50, 'image': 'images/ชานมกาแฟ.jpg'},
    {'name': 'ชานมเย็น', 'price': 50, 'image': 'images/ชานมเย็น.jpg'},
    {'name': 'ชานมโกโก้', 'price': 50, 'image': 'images/ชานมโกโก้.jpg'},
    {'name': 'ชานมสดคาราเมล', 'price': 50, 'image': 'images/คาราเมล.jpg'},
  ];

  final ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Product List'),
        
        
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showAddDialog(context);
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutMeScreen()),
              );
            },
            icon: Icon(Icons.person_3),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: service.getProductList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List products = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = products[index];
                      String id = document.id;
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text("ชื่อเมนู: ${data['productname']}"),
                        subtitle: Text('Price: ${data['price']} บาท'),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showEditDialog(context, data, id);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("No data in firebase");
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // แสดง dialog box สำหรับเพิ่มสินค้า
  void _showAddDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: descriptionController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Descriptions'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                service.addProduct(
                  priceController.text,
                  descriptionController.text,
                  int.parse(priceController.text),
                );
                // // ดำเนินการเพิ่มสินค้า
                // String name = nameController.text;
                // int price = int.tryParse(priceController.text) ?? 0;
                // // ทำอะไรสักอย่าง...
                // // ตามด้วยคำสั่งปิด dialog box
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // แสดง dialog box สำหรับแก้ไขสินค้า
  void _showEditDialog(
      BuildContext context, Map<String, dynamic> product, String id) {
    final TextEditingController nameController =
        TextEditingController(text: product['productname']);
    final TextEditingController descriptionController =
        TextEditingController(text: product['description']);
    final TextEditingController priceController =
        TextEditingController(text: product['price'].toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: descriptionController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                service.updateProduct(
                  id,
                  nameController.text,
                  descriptionController.text,
                  int.parse(priceController.text),
                );
                Navigator.of(context).pop();
              },
              child: const Text('add'),
            ),
            ElevatedButton(
              onPressed: () {
                service.deleteProduct(id);
                // ดำเนินการแก้ไขสินค้า
                // String name = nameController.text;
                // int price = int.tryParse(priceController.text) ?? 0;
                // ทำอะไรสักอย่าง...
                // ตามด้วยคำสั่งปิด dialog box
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}


// IconButton(
                              //   onPressed: () {
                              //     productNameController.text =
                              //         data['productname'];
                              //     descriptionController.text =
                              //         data['description'];
                              //     priceController.text =
                              //         data['price'].toString();
                              //     Get.defaultDialog(
                              //         title: "แก้ไขเมนู",
                              //         content: Column(
                              //           children: [
                              //             Padding(
                              //               padding: const EdgeInsets.all(10.0),
                              //               child: TextField(
                              //                 controller: productNameController,
                              //                 decoration: InputDecoration(
                              //                     labelText: "ชื่อเมนู",
                              //                     border: OutlineInputBorder()),
                              //               ),
                              //             ),
                              //             Padding(
                              //               padding: const EdgeInsets.all(10.0),
                              //               child: TextField(
                              //                 controller: descriptionController,
                              //                 decoration: InputDecoration(
                              //                     labelText: "รายละเอียด",
                              //                     border: OutlineInputBorder()),
                              //               ),
                              //             ),
                              //             Padding(
                              //               padding: const EdgeInsets.all(10.0),
                              //               child: TextField(
                              //                 controller: priceController,
                              //                 decoration: InputDecoration(
                              //                     labelText: "ราคา",
                              //                     border: OutlineInputBorder()),
                              //               ),
                              //             ),
                              //             // Container(
                              //             //   width: double.infinity,
                              //             //   child: Row(
                              //             //     mainAxisAlignment:
                              //             //         MainAxisAlignment.center,
                              //             //     children: [
                              //             //       ElevatedButton(
                              //             //           onPressed: () {
                              //             //             fireBaseController.updateProduct(
                              //             //                 docID,
                              //             //                 productNameController
                              //             //                     .text,
                              //             //                 descriptionController
                              //             //                     .text,
                              //             //                 double.parse(
                              //             //                     priceController
                              //             //                         .text));
                              //             //             productNameController
                              //             //                 .clear();
                              //             //             descriptionController
                              //             //                 .clear();
                              //             //             priceController.clear();
                              //             //             Get.back();
                              //             //           },
                              //             //           child: Text("แก้ไข")),
                              //             //       SizedBox(width: 10),
                              //             //       ElevatedButton(
                              //             //         onPressed: () {
                              //             //           fireBaseController
                              //             //               .deleteProduct(docID);
                              //             //           Get.back();
                              //             //         },
                              //             //         child: Text("ลบ"),
                              //             //       ),
                              //             //       SizedBox(width: 10),
                              //             //       ElevatedButton(
                              //             //         onPressed: () {
                              //             //           Get.back();
                              //             //         },
                              //             //         child: Text("ปิด"),
                              //             //       ),
                              //             //     ],
                              //             //   ),
                              //             // )
                              //           ],
                              //         ));
                              //   },
                              //   icon: Icon(Icons.edit),
                              // ),