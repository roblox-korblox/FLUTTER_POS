// File: printedreceiptpaper.dart
import 'package:flutter/material.dart';

class Printedreceiptpaper extends StatefulWidget {
  const Printedreceiptpaper({super.key});

  @override
  State<Printedreceiptpaper> createState() => _PrintedreceiptpaperState();
}

class _PrintedreceiptpaperState extends State<Printedreceiptpaper> {
  final Map<String, dynamic> transaction = {
    "id": "#1",
    "date": "10/01/2026, 21:32",
    "cashier": "Cashier 1",
    "items": [
      {"name": "Matcha", "price": 24500, "quantity": 1},
    ],
    "received": 50000,
  };

  @override
  Widget build(BuildContext context) {
    int totalPrice = transaction["items"]
        .fold(0, (sum, item) => sum + item["price"] * item["quantity"]);
    int change = transaction["received"] - totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Print Receipt"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          
                   Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(vertical: 16),
  color: Colors.blue,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Text(
        "Point Of Sale",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      SizedBox(height: 4),
      Text(
        "TRANSACTION RECEIPT",
        style: TextStyle(
          color: Colors.white70,
          fontSize: 12,
          letterSpacing: 1,
        ),
      ),
    ],
  ),
),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        "TRANSACTION RECEIPT",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            letterSpacing: 1),
                      ),
                    ),
                    const SizedBox(height: 16),

             
                    _buildInfoRow("Transaction No.", transaction["id"]),
                    _buildInfoRow("Date", transaction["date"]),
                    _buildInfoRow("Cashier", transaction["cashier"]),
                    const Divider(height: 24, thickness: 1),

              
                    ...transaction["items"].map<Widget>((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${item["name"]} x${item["quantity"]}",
                                style: const TextStyle(fontSize: 16)),
                            Text("Rp ${item["price"]}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    }).toList(),
                    const Divider(height: 24, thickness: 1),

   
                    _buildInfoRow("TOTAL", "Rp $totalPrice",
                        valueColor: Colors.blue, fontWeight: FontWeight.bold),
                    _buildInfoRow("Cash", "Rp ${transaction["received"]}"),
                    _buildInfoRow("Change", "Rp $change"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),


            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.grey[200],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Select Printer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 8),
                    Text(
                      "No printer found.\nMake sure your printer is paired in Bluetooth settings.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),


            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.print),
                    label: const Text("Print Receipt"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value,
      {Color? valueColor, FontWeight fontWeight = FontWeight.normal}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: TextStyle(
                fontWeight: fontWeight, color: valueColor ?? Colors.black),
          ),
        ],
      ),
    );
  }
}