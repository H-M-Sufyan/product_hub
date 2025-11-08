import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:product_hub/utils/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<String> productImages = [
    'assets/images/product1.png',
    'assets/images/product1.png',
    'assets/images/product1.png',
    'assets/images/product1.png',
    'assets/images/product1.png',
  ];

  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    items: productImages.map((img) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(img, fit: BoxFit.cover, width: double.infinity),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 250,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${_currentImageIndex + 1}/${productImages.length}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Product Name & Price
              Text(
                "TMA-2HD Wireless",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "\$199",
                style: TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  Icon(Icons.star_half, color: Colors.amber, size: 18),
                  Icon(Icons.star_border, color: Colors.amber, size: 18),
                  SizedBox(width: 8),
                  Text("4.5 (24 Reviews)"),
                ],
              ),
              SizedBox(height: 16),

              // Seller Info
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/product1.png'),
                ),
                title: Text("Shop Larson Electronics"),
                subtitle: Text("Official Store"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              SizedBox(height: 16),

              // Description
              Text(
                "Description Product",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "This is a high-quality wireless TMA-2HD product designed for music lovers and professionals. It features exceptional sound clarity and durable build.",
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
              ),
              SizedBox(height: 16),

              // Reviews Section
              Text(
                "Reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: List.generate(3, (index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/product2.png'),
                      ),
                      title: Text("User ${index + 1}"),
                      subtitle: Text("Amazing product, really loved it!"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (starIndex) {
                          return Icon(
                            starIndex < 4 ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 16,
                          );
                        }),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 80), // Extra space for bottom buttons
            ],
          ),
        ),
      ),

      // Bottom Buttons
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.favorite, color: Colors.white),
                label: Text("Favorite", style: TextStyle(color: AppColors.fontColor),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                label: Text("Add to Cart", style: TextStyle(color: AppColors.fontColor),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
