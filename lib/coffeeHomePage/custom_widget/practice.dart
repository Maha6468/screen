import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Detail Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ProductDetailPage(),
    );
  }
}

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedSizeIndex = 2; // default Venti
  int quantity = 1;

  final List<Map<String, String>> sizes = [
    {'label': 'Tall', 'sub': '12 Fl Oz'},
    {'label': 'Grande', 'sub': '16 Fl Oz'},
    {'label': 'Venti', 'sub': '24 Fl Oz'},
    {'label': 'Custom', 'sub': ''},
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(
            children: [
              // top row with back icon and a small cart icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Navigator.of(context).maybePop(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back, size: 28),
                    ),
                  ),
                  // small cart icon
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.shopping_bag_outlined),
                  )
                ],
              ),

              const SizedBox(height: 10),

              // Image area with circular green background
              SizedBox(
                height: media.height * 0.42,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // green circle
                    Positioned(
                      top: 10,
                      child: Container(
                        width: media.width * 0.7,
                        height: media.width * 0.7,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1EA87A), // green
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // large card for image and drop shadow
                    Positioned(
                      top: 30,
                      child: Container(
                        width: media.width * 0.78,
                        height: media.width * 0.78,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // product image
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        width: media.width * 0.6,
                        height: media.width * 0.6,
                        child: Image.asset(
                          'assets/images/coffee.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Title and price row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Flexible(
                    child: Text(
                      'Caramel\nFrappuccino',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '\$30.00',
                    style: TextStyle(
                      color: Color(0xFF1EA87A),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Size Options',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),

              const SizedBox(height: 10),

              // Size options row
              SizedBox(
                height: 92,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final isSelected = index == selectedSizeIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSizeIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 84,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.white70,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: isSelected
                              ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            )
                          ]
                              : null,
                          border: Border.all(
                            color: isSelected ? const Color(0xFF1EA87A) : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFF1EA87A).withOpacity(0.12) : Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.local_cafe, size: 26),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              sizes[index]['label']!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (sizes[index]['sub']!.isNotEmpty)
                              Text(
                                sizes[index]['sub']!,
                                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                              )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Spacer(),

              // quantity and add to order
              Row(
                children: [
                  // quantity control
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Add to order button expanded
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1EA87A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      onPressed: () {
                        // handle add to order
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Added ${quantity} x ${sizes[selectedSizeIndex]['label']}')),
                        );
                      },
                      child: const Text(
                        'Add to Order',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
