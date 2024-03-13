import 'package:flutter/material.dart';

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
        ],
      ),
      body: ListView.builder(
        itemCount: milkTeaMenu.length,
        itemBuilder: (context, index) {
          // สร้างไอเท็มของรายการสินค้าแต่ละรายการ
          return ListTile(
            title: Text(milkTeaMenu[index]['name']),
            subtitle: Text('Price: ${milkTeaMenu[index]['price']} บาท'),
            leading: CircleAvatar(
              backgroundImage: AssetImage(milkTeaMenu[index]['image']),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                _showEditDialog(context, milkTeaMenu[index]);
              },
            ),
          );
        },
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
                controller: priceController,
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
                // ดำเนินการเพิ่มสินค้า
                String name = nameController.text;
                int price = int.tryParse(priceController.text) ?? 0;
                // ทำอะไรสักอย่าง...
                // ตามด้วยคำสั่งปิด dialog box
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
  void _showEditDialog(BuildContext context, Map<String, dynamic> product) {
    final TextEditingController nameController =
        TextEditingController(text: product['name']);
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
                controller: priceController,
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
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Edit'),
            ),
            ElevatedButton(
              onPressed: () {
                // ดำเนินการแก้ไขสินค้า
                String name = nameController.text;
                int price = int.tryParse(priceController.text) ?? 0;
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
