import 'package:flutter/material.dart';

class Keranjanganan extends StatefulWidget {
  const Keranjanganan({super.key});

  @override
  State<Keranjanganan> createState() => _KeranjangananState();
}

class _KeranjangananState extends State<Keranjanganan> {
  // Example cart item
  Map<String, dynamic> cartItem = {
    "name": "Matcha",
    "category": "Minuman",
    "price": 25000,
    "quantity": 1,
  };

  void increment() {
    setState(() {
      cartItem["quantity"] += 1;
    });
  }

  void decrement() {
    setState(() {
      if (cartItem["quantity"] > 1) cartItem["quantity"] -= 1;
    });
  }

  void removeItem() {
    setState(() {
      cartItem = {};
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = cartItem.isEmpty ? 0 : cartItem["quantity"];
    int totalPrice =
        cartItem.isEmpty ? 0 : cartItem["price"] * cartItem["quantity"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: cartItem.isEmpty
          ? const Center(child: Text("Keranjang kosong"))
          : Column(
              children: [
                // Cart item card
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Icon instead of product image
                          const Icon(
                            Icons.shopping_bag,
                            size: 50,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 12),

                          // Product info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem["name"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  cartItem["category"],
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  "Rp ${cartItem["price"]}",
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),

                          // Quantity controls
                          Row(
                            children: [
                              GestureDetector(
                                onTap: decrement,
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.remove,
                                      size: 16, color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Text("${cartItem["quantity"]}"),
                              ),
                              GestureDetector(
                                onTap: increment,
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.green,
                                  child: Icon(Icons.add,
                                      size: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 12),

                          // Delete button
                          GestureDetector(
                            onTap: removeItem,
                            child: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // Bottom total & pay
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0, -2),
                          blurRadius: 6)
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Item: $totalItems produk"),
                          Text("Total Harga: Rp $totalPrice",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(45),
                          ),
                          child: const Text("Bayar Pesanan"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
