import 'package:flutter/material.dart';
import 'package:product_hub/utils/colors.dart';

class AddToCartPopup {
  static void show(BuildContext context, String productName, double price) {
    int quantity = 1;
    String selectedVariant = "Black";
    List<String> variants = ["Black", "White", "Blue"];

    showDialog(
      context: context,
      barrierColor: Colors.black54, 
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double totalPrice = price * quantity;

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close),
                        ),
                      ],
                    ),
                    Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) setState(() => quantity--);
                              },
                              icon: Icon(Icons.remove_circle_outline),
                            ),
                            Text(
                              quantity.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () => setState(() => quantity++),
                              icon: Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Variant",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: variants.map((variant) {
                              bool isSelected = variant == selectedVariant;
                              return GestureDetector(
                                onTap: () =>
                                    setState(() => selectedVariant = variant),
                                child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      variant,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "$quantity x $productName added to cart",
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.shopping_cart, color: AppColors.fontColor,),
                        label: Text("Add to Cart", style: TextStyle(color: AppColors.fontColor),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
