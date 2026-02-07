import 'package:flutter/material.dart';
import 'dart:io';

class Tambahanbarang extends StatefulWidget {
  const Tambahanbarang({super.key});

  @override
  State<Tambahanbarang> createState() => _TambahanbarangState();
}

class _TambahanbarangState extends State<Tambahanbarang> {
  File? imageFile;

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();
  final TextEditingController stockCtrl = TextEditingController();
  final TextEditingController discountCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();

  String selectedCategory = "Food";
  String selectedStatus = "Available";

  void addProduct() {

    print("Name: ${nameCtrl.text}");
    print("Price: ${priceCtrl.text}");
    print("Stock: ${stockCtrl.text}");
    print("Discount: ${discountCtrl.text}");
    print("Description: ${descriptionCtrl.text}");
    print("Category: $selectedCategory");
    print("Status: $selectedStatus");
    print("Image: ${imageFile?.path}");

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
  
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.image, size: 50, color: Colors.grey),
                  SizedBox(height: 8),
                  Text("Pick Image", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 16),

   
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.shopping_bag),
                hintText: "Product Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),


            TextField(
              controller: priceCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.attach_money),
                hintText: "Price",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),


            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: stockCtrl,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.inventory_2),
                      hintText: "Stock",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: discountCtrl,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.sell),
                      hintText: "Discount (%)",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),


            TextField(
              controller: descriptionCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.description),
                hintText: "Description",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                filled: true,
                fillColor: Colors.white,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),


            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
 
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 8),
                    child: Text(
                      "Category",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),


                  ChoiceChip(
                    label: Row(
                      children: const [
                        Icon(Icons.restaurant, size: 16),
                        SizedBox(width: 26),
                        Text("Food"),
                      ],
                    ),
                    selected: selectedCategory == "Food",
                    onSelected: (_) => setState(() => selectedCategory = "Food"),
                    backgroundColor: Colors.grey[300],
                    selectedColor: Colors.white,
                  ),
                  const SizedBox(width: 12),

                  ChoiceChip(
                    label: Row(
                      children: const [
                        Icon(Icons.local_drink, size: 16),
                        SizedBox(width: 4),
                        Text("Beverage"),
                      ],
                    ),
                    selected: selectedCategory == "Beverage",
                    onSelected: (_) => setState(() => selectedCategory = "Beverage"),
                    backgroundColor: Colors.grey[300],
                    selectedColor: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),


            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [

                  const Padding(
                    padding: EdgeInsets.only(left: 35, right: 8),
                    child: Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),


                  ChoiceChip(
                    label: Row(
                      children: const [
                        Icon(Icons.check, size: 16),
                        SizedBox(width: 4),
                        Text("Available"),
                      ],
                    ),
                    selected: selectedStatus == "Available",
                    onSelected: (_) => setState(() => selectedStatus = "Available"),
                    backgroundColor: Colors.grey[300],
                    selectedColor: Colors.white,
                  ),
                  const SizedBox(width: 12),


                  ChoiceChip(
                    label: Row(
                      children: const [
                        Icon(Icons.close, size: 16),
                        SizedBox(width: 4),
                        Text("Sold Out"),
                      ],
                    ),
                    selected: selectedStatus == "Sold Out",
                    onSelected: (_) => setState(() => selectedStatus = "Sold Out"),
                    backgroundColor: Colors.grey[300],
                    selectedColor: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),


            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: addProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Add Product", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
