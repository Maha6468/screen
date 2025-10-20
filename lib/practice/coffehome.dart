import 'package:flutter/material.dart';

class CoffeeHomePage extends StatelessWidget {
  const CoffeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0E6),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildTitle(),
            const SizedBox(height: 30),
            _buildMainDrink(), // এখন mainDrink এর ভেতরেই category চলে গেছে
          ],
        ),
      ),
    );
  }

  // 🧭 Header Section
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Qahwa\nSpace",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          Icon(Icons.shopping_bag_outlined, color: Colors.brown[400]),
        ],
      ),
    );
  }

  // 📝 Title
  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "Smooth Out\nYour Everyday",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  // 🍩 Category Row
  Widget _buildCategoryRow() {
    List<Map<String, String>> categories = [
      {"icon": "☕", "title": "HOT COFFEE"},
      {"icon": "🥤", "title": "DRINKS"},
      {"icon": "🍵", "title": "HOT TEAS"},
      {"icon": "🧁", "title": "BAKERY"},
    ];

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          var item = categories[index];
          return Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.green[200],
                child: Text(
                  item["icon"]!,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item["title"]!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.brown,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // 🍹 Main Drink Display (এখানে category ও আছে)
  Widget _buildMainDrink() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF1E4D2B),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // এখানে Category Row টা ঢোকানো হয়েছে
            _buildCategoryRow(),

            const SizedBox(height: 30),

            Image.asset(
              "assets/images/frappuccino.png", // তোমার ইমেজ path
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              "Caramel Frappuccino",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "\$30.00",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
