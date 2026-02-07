import 'package:flutter/material.dart';

class Pengeluaran extends StatefulWidget {
  const Pengeluaran({super.key});

  @override
  State<Pengeluaran> createState() => _PengeluaranState();
}

class _PengeluaranState extends State<Pengeluaran>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 1; 
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Finance"),
        actions: const [
          Icon(Icons.delete_outline),
          SizedBox(width: 16),
          Icon(Icons.logout),
          SizedBox(width: 16),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.account_balance_wallet),
              text: "Input Capital",
            ),
            Tab(
              icon: Icon(Icons.trending_down),
              text: "Input Expenses",
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          const SizedBox(), 

          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add Expenses",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money),
                    labelText: "Total Expenses (Rp)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    labelText: "Description (ex: buy...)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

            SizedBox(
  width: double.infinity,
  height: 48,
  child: ElevatedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.save),
    label: const Text("Save Expenses"),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,        
      foregroundColor: Colors.white,      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), 
      ),
    ),
  ),
),
                const SizedBox(height: 32),

                const Text(
                  "Expenses History",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

Container(
  width: double.infinity,
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 211, 211, 211), 
    borderRadius: BorderRadius.circular(12),
  ),
  child: Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        "No expense history yet",
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 14,
        ),
      ),
    ),
  ),
),
              ],
            ),
          ),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Finance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
        ],
      ),
    );
  }
}