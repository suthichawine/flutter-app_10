import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
        itemCount: 10, // จำนวนสินค้า
        itemBuilder: (context, index) {
          // สร้างไอเท็มของรายการสินค้าแต่ละรายการ
          return ListTile(
            title: Text('Product ${index + 1}'),
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
