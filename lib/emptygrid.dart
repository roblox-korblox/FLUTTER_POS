import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmptyGrid(),
    );
  }
}

class EmptyGrid extends StatefulWidget {
  const EmptyGrid({super.key});

  @override
  State<EmptyGrid> createState() => _EmptyGridState();
}

class _EmptyGridState extends State<EmptyGrid> {
  bool isGrid = true;
  int currentIndex = 1;

  final TextEditingController searchCtrl = TextEditingController();
  String searchQuery = "";

  String selectedCategory = "All";

  final List<Map<String, dynamic>> products = [];

  List<Map<String, dynamic>> get filteredProducts {
    List<Map<String, dynamic>> list = products
        .where((p) => p["name"]
            .toString()
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    if (selectedCategory != "All") {
      list = list.where((p) => p["category"] == selectedCategory).toList();
    }

    return list;
  }

  void addOrEditProduct({Map<String, dynamic>? product, int? index}) {
    final nameCtrl = TextEditingController(text: product?["name"]);
    final priceCtrl =
        TextEditingController(text: product?["price"]?.toString());
    final stockCtrl =
        TextEditingController(text: product?["stock"]?.toString());

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(product == null ? "Add Product" : "Edit Product"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: "Name")),
            TextField(controller: priceCtrl, decoration: const InputDecoration(labelText: "Price"), keyboardType: TextInputType.number),
            TextField(controller: stockCtrl, decoration: const InputDecoration(labelText: "Stock"), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              setState(() {
                final data = {
                  "name": nameCtrl.text,
                  "price": int.tryParse(priceCtrl.text) ?? 0,
                  "stock": int.tryParse(stockCtrl.text) ?? 0,
                  "image": product?["image"] ?? "assets/latte.jpg",
                  "category": product?["category"] ?? "Beverage",
                  "discount": product?["discount"] ?? 0,
                };
                if (product == null) {
                  products.add(data);
                } else {
                  products[index!] = data;
                }
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void deleteProduct(int index) {
    setState(() => products.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: const Text("Product", style: TextStyle(color: Colors.white)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.share, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [

          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: searchCtrl,
                    onChanged: (v) => setState(() => searchQuery = v),
                    decoration: InputDecoration(
                      hintText: "Search product...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 218, 218, 218),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ["All", "Food", "Beverage"].map((c) {
                      final selected = selectedCategory == c;
                      return GestureDetector(
                        onTap: () => setState(() => selectedCategory = c),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                          decoration: BoxDecoration(
                            color: selected ? const Color.fromARGB(255, 0, 140, 255) : const Color.fromARGB(255, 216, 216, 216),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            c,
                            style: TextStyle(color: selected ? Colors.white : const Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),


          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey),
                        SizedBox(height: 12),
                        Text(
                          "No data",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (_, i) => Container(),
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        onPressed: () => addOrEditProduct(),
        icon: const Icon(Icons.add),
        label: const Text("Add Product"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 24, 112, 184),
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: "Product"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Finance"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        ],
      ),
    );
  }
}

