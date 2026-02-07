import 'package:flutter/material.dart';

class Cardmodal extends StatefulWidget {
  const Cardmodal({super.key});

  @override
  State<Cardmodal> createState() => _CardmodalState();
}

class _CardmodalState extends State<Cardmodal> {
  final TextEditingController modalCtrl = TextEditingController();
  final TextEditingController noteCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Finance"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline), // 🗑️ bin icon
            onPressed: () {
              // TODO: handle delete all capital entries
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app), // 🚪 exit icon
            onPressed: () {
              // TODO: handle exit action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.account_balance_wallet, color: Colors.blue),
                      SizedBox(height: 4),
                      Text("Input Capital",
                          style: TextStyle(color: Colors.blue)),
                      Divider(color: Colors.blue, thickness: 2),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.trending_down),
                      SizedBox(height: 4),
                      Text("Input Expenses"),
                      Divider(color: Colors.transparent, thickness: 2),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              "Tambah Modal",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: modalCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.attach_money),
                hintText: "Total Capital (Rp)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: noteCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.description),
                hintText: "Description (optional)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text("Save Capital"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              "Capital History",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet,
                  color: Colors.orange,
                ),
                title: const Text(
                  "Rp 500.000",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Initial Capital"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}