import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({Key? key}) : super(key: key);

  // รายการเมนูชานมพร้อมราคา
  final List<Map<String, dynamic>> milkTeaMenu = [
    {'name': 'ชานมไต้หวัน', 'price': 50},
    {'name': 'ชานมเนสคาเฟ', 'price': 50},
    {'name': 'ชานมเย็น', 'price': 50},
    {'name': 'ชานมนมสด', 'price': 50},
    {'name': 'ชานมเย็นโกโก้', 'price': 50},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // เมนูสำหรับเพิ่มสินค้า
              // สามารถเปิดหน้าเพิ่มสินค้าหรือทำอะไรตามต้องการ
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: milkTeaMenu.length,
        itemBuilder: (context, index) {
          // สร้างไอเท็มของรายการสินค้าแต่ละรายการ
          return ListTile(
            title: Text(milkTeaMenu[index]['name']),
            subtitle: Text('Price: ${milkTeaMenu[index]['price']} บาท'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // เมนูสำหรับแก้ไขสินค้า
                // สามารถเปิดหน้าแก้ไขสินค้าหรือทำอะไรตามต้องการ
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // เมนูสำหรับเพิ่มสินค้า (สำหรับ FAB)
          // สามารถเปิดหน้าเพิ่มสินค้าหรือทำอะไรตามต้องการ
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
